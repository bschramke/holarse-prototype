# encoding: utf-8
require 'rubygems'
require 'jdbc/mysql'
require 'java'

namespace :import do
  
  puts "Verbinde zur alten MySQL-Datenbank..."
  
  Java::com.mysql.jdbc.Driver
  jdbcurl = "jdbc:mysql://localhost/holarse"
  connection = java.sql.DriverManager.get_connection jdbcurl, "holarse", "holarse"
  
	desc "import data from drupal"
	task :users => :environment do	
	  #
	  # Die bisherigen Bilder löschen
	  #
	  FileUtils.remove_dir "#{Rails.root}/public/system/users"
	  
	  #
	  # Bessere Sicht auf die Felder erzeugen
	  #
    create_fields_view = "create or replace view field_view as select category, title, value, profile_values.fid as fid, profile_values.uid as uid from profile_values inner join profile_fields on profile_values.fid = profile_fields.fid;";
    stmt = connection.create_statement
    stmt.execute_update create_fields_view
    stmt.close    
    
    #
    # Benutzer auslesen
    #
    user_query = "select uid, name, pass, mail, picture, from_unixtime(created) as created, from_unixtime(login) as login, (select group_concat(name) from users_roles inner join role on role.rid = users_roles.rid where users_roles.uid = users.uid) as roles, (select signature from users_signature where users_signature.uid = users.uid) as signature from users where name != '' and status = 1 order by name;";
    user_personal_query = "select * from field_view where uid = ?";
    user_role_query = "select name from role inner join users_roles using (rid) where uid = ?";
    
    puts "Benutzer uebertragen"
    stmt = connection.create_statement
    User.delete_all
    # Daten auslesen und einspielen
    rs = stmt.execute_query user_query
    while (rs.next) do
      uid = rs.getObject("uid")
      puts "Übertrage #{rs.getObject("name")}"
      u = User.new
      u.username = rs.getObject("name").force_encoding("utf-8")
      u.old_password_hash = rs.getObject("pass")
      u.password = (0...8).map{65.+(rand(25)).chr}.join # generate a random password
      u.avatar = File.open(rs.getObject("picture")) unless rs.getObject("picture").nil? || rs.getObject("picture").empty?
      u.created_at = rs.getTimestamp("created").getTime()
      u.last_login = rs.getTimestamp("login").getTime()
      u.signature = rs.getObject("signature") unless rs.getObject("signature").nil?
      u.email = rs.getObject("mail")
      
      u.roles = []
      stmt_roles = connection.prepare_statement user_role_query
      stmt_roles.setObject(1, uid)
      rs_roles = stmt_roles.execute_query
      while (rs_roles.next) do
        u.roles << rs_roles.getObject("name")
      end
      stmt_roles.close
      
      stmt_personal = connection.prepare_statement user_personal_query
      stmt_personal.setObject(1, uid)
      rs_personal = stmt_personal.execute_query 
      while (rs_personal.next) do
        case rs_personal.getObject('category').force_encoding("utf-8")
        when 'Holarse Services'
          case rs_personal.getObject("title")
          when 'Minecraft'
            u.minecraft_whitelisted = true
          when 'Minecraft-Benutzername'
            u.minecraft_username = rs_personal.getObject("value")
          end
        when 'Linuxspiele'
          case rs_personal.getObject("title")
          when 'Lieblingsspiele'
            u.favourite_games = rs_personal.getObject("value").split("\r\n")
          end
        when 'Kontakt'
          case rs_personal.getObject("title")
          when 'ICQ'
            u.icq = rs_personal.getObject("value")
          when 'Jabber'
            u.jabber = rs_personal.getObject("value")
          end
        when 'Persönliche Informationen'
          case rs_personal.getObject("title")
          when 'Beruf'
            u.job = rs_personal.getObject("value")
          when 'Stadt'
            u.city = rs_personal.getObject("value")
          when 'Geburtstag'
            u.birthday = Date.parse(rs_personal.getObject("value").scan(/"(\d+)"/).join("-")) unless rs_personal.getObject("value").empty?
          end
        when 'Rechnerkonfiguration'
          case rs_personal.getObject("title")
          when 'Betriebssystem'
            u.distro = rs_personal.getObject("value")
          when 'Grafikkarte'
            u.graphics = rs_personal.getObject("value")
          end
        end
      end
      rs_personal.close
      stmt_personal.close
      u.save!
    end
    rs.close
    stmt.close
  end

  task :news  => :environment do	   
	  #
	  # Die bisherigen Bilder löschen
	  #
	  FileUtils.remove_dir "#{Rails.root}/public/system/news"
	    
    #
    # News auslesen
    #
    puts "Übertrage News"
    news_query = "select n.nid as nid, v.vid as vid, v.title as title, from_unixtime(n.created) as created_at, from_unixtime(v.timestamp) as updated_at, v.teaser as teaser, v.body as body, u.name as username from node n inner   join node_revisions v using (vid) inner join users u on u.uid = n.uid where n.type = 'story' order by created_at "

    comments_query = "select u.name as username, c.comment as content, c.hostname as hostname, from_unixtime(c.timestamp) as created_at from comments c inner join users u using (uid) where c.nid = ? order by c.timestamp asc"

    images_query = "select delta as position, filepath from content_field_screenshots inner join files on content_field_screenshots.field_screenshots_fid = files.fid where filepath is not null and vid = ?"
    files_query = "select filepath from content_field_attachments inner join files on content_field_attachments.field_attachments_fid = files.fid where vid = ?"
    videos_query = "select field_video_embed as video from content_field_video where field_video_embed is not null and vid = ?"

    voting_query = "select value, users.name as username from votingapi_vote inner join users using (uid) where uid > 0 and content_id =";
    homepage_query = "select * from content_field_homepage where field_homepage_value is not null and vid = ?";

    News.delete_all
    stmt = connection.create_statement
    rs = stmt.execute_query news_query
    while (rs.next) do
      n = News.new
      n.title = rs.getObject("title").force_encoding("utf-8")
      # TODO timestamp wird seltsam umgewandelt
      n.created_at = rs.getTimestamp("created_at").getTime()
      puts "Übertrage #{n.created_at} #{n.title}"      
      n.updated_at = rs.getTimestamp("updated_at").getTime()
      n.content = rs.getObject("body")
      n.author = User.find_by_slug(rs.getObject("username"))
      
      # Comments
      n.comments = []
      stmt_comments = connection.prepare_statement comments_query
      stmt_comments.setObject(1, rs.getObject('nid'))
      rs_comments = stmt_comments.execute_query
      while (rs_comments.next) do
        c = Comment.new
        c.content = rs_comments.getObject("content")
        c.created_at = rs_comments.getTimestamp("created_at").getTime()
        c.author = rs_comments.getObject("username")
        c.released = true
        
        n.comments << c
      end
      rs_comments.close
      stmt_comments.close

      # Images
      n.screenshots = []
      stmt_screenshots = connection.prepare_statement images_query
      stmt_screenshots.setObject(1, rs.getObject("vid"))
      rs_screenshots = stmt_screenshots.execute_query
      while (rs_screenshots.next) do
        image = Screenshot.new
        image.img = File.open(rs_screenshots.getObject("filepath"))
        image.description = 'Importiert'
        image.position = rs_screenshots.getObject("position")
        n.screenshots << image
      end
      rs_screenshots.close
      stmt_screenshots.close

      # File-attachments
      n.attachments = []
      stmt_attach = connection.prepare_statement files_query
      stmt_attach.setObject(1, rs.getObject("vid"))      
      rs_attach = stmt_attach.execute_query
      while (rs_attach.next) do
        m = Fileattachment.new
        m.attachmentfile = File.open(rs.getObject("filepath"))
        m.description = 'Importiert'

        n.attachments << m
      end
      rs_attach.close
      stmt_attach.close

      # Videos
      n.videos = []
      stmt_videos = connection.prepare_statement videos_query
      stmt_videos.setObject(1, rs.getObject("vid"))
      rs_videos = stmt_videos.execute_query
      while (rs_videos.next) do
        m = Video.new(:url => rs.getObject("video"), :description => '')

        n.videos << m
      end
      rs_videos.close
      stmt_videos.close

      # News-Links
      n.links = []
      stmt_links = connection.prepare_statement homepage_query
      stmt_links.setObject(1, rs.getObject("vid"))
      rs_links = stmt_links.execute_query
      while (rs_links.next) do
        text = rs.getObject("field_homepage_value")
        case text
         when /(http:\S+)\s+(\w+)/; # [http://url beschreibung]
          elements = text.scan(/(http:\S+)\s+(\w+)/)
          link = Link.new(:url => elements[0], :description => elements[1])
         when /(http:\S+)/;
          elements = text.scan(/(http:\S+)/)
          link = Link.new(:url => elements[0])
         else
          link = Link.new(:url => text)
        end

        n.links << link
      end
      stmt_links.close
      rs_links.close

      n.save!
    end
  end

  task :articles => :environment do	
    p "Artikel übertragen"
    article_query = "select n.nid as nid, r.vid, r.title, from_unixtime(n.created) as created_at, from_unixtime(r.timestamp) as updated_at, r.body, u.name as username from node n inner join node_revisions r on n.vid = r.vid inner join users u on u.uid = n.uid where r.body is not null and r.body != '' and n.type = 'page'"
    tags_query = "select name as tag from term_node inner join term_data using (tid) where term_node.vid = ";
    nodevalue_query = "select * from content_type_page where vid = ";

    Article.delete_all
    mysql.query(article_query).each do |row|
      a = Article.new
      a.title = row['title']
      a.aliases = []
      a.created_at = row['created_at']
      a.updated_at = row['updated_at']
      a.content = row['body']
      a.user = User.find_by_username(row['username'])

      # Comments
      a.comments = [] 
      mysql.query(comments_query + " where c.nid = '#{row['nid']}' order by c.timestamp asc").each do |rowc|
        c = Comment.new
        c.username = rowc['username']
        c.content = rowc['content']
        c.created_at = rowc['created_at']
        a.comments << c
      end

      # Tags
      a.tags = []
      mysql.query(tags_query + " '#{row['vid']}'").each do |rowt|
        if rowt['tag'] != nil
          a.tags << rowt['tag']
        end
      end

      # Images
      a.images = []
      mysql.query(images_query + " '#{row['vid']}'").each do |rowi|
        m = Image.new
        m.picture = File.open(rowi['filepath'])
        m.description = 'Importiert'
        m.position = rowi['position']

        a.images << m	
      end

      # File-attachments
      a.fileattachments = []
      mysql.query(files_query + " '#{row['vid']}'").each do |rowf|
        m = Fileattachment.new
        m.appendage = File.open(rowf['filepath'])
        m.description = 'Importiert'

        a.fileattachments << m
      end

      # Videos
      a.videos = []
      mysql.query(videos_query + " '#{row['vid']}'").each do |rowv|
        m = Video.new
        m.url = rowv['video']
        m.description = 'Importiert'

        a.videos << m
      end

      #
      # Wine, Cedega, CrossOver-Infos, Artikel-Infos
      #
      mysql.query(nodevalue_query + " #{row['vid']}").each do |rowstuff|
        wine = Wine.new
        wine.versions = []
        wine.versions << rowstuff['field_wine_value']
        wine.winehq = rowstuff['field_winehq_value']
        wine.toprating = rowstuff['field_wine_top_rating_value']

        crossover = Crossover.new
        crossover.gamesdb = rowstuff['field_crossoverdb_value']
        crossover.toprating = rowstuff['field_crossover_top_rating_value']
      end

      # Artikel-Links
      a.links = []
      mysql.query(homepage_query + " #{row['vid']}").each do |rowweb|
        text = rowweb['field_homepage_value']
        hlink = Link.new(:url => text)

        a.links << hlink
      end


      a.save!
    end
  end
end
