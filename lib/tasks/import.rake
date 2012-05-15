# encoding: utf-8
require 'rubygems'
require "mysql2"

namespace :importdrupal do
  
	p "Verbinde zur alten MySQL-Datenbank"
	mysql = Mysql2::Client.new(:host => "localhost", :username => "holarse", :password => "holarse", :database => "holarse")
 
	desc "import data from drupal"
	task :users => :environment do	
    
    #
    # Benutzer auslesen
    #
    user_query = "select uid, name, pass, mail, picture, from_unixtime(created) as created, from_unixtime(login) as login, (select group_concat(name) from users_roles inner join role on role.rid = users_roles.rid where users_roles.uid = users.uid) as roles, (select signature from users_signature where users_signature.uid = users.uid) as signature from users where name != '' and status = 1 order by name;";
    
    user_personal_query = "select * from field_view where fid != 3";
    
    create_fields_view = "create or replace view field_view as select category, title, value, profile_values.fid as fid, profile_values.uid as uid from profile_values inner join profile_fields on profile_values.fid = profile_fields.fid;";
    mysql.query(create_fields_view);
    
    user_role_query = "select name from role  inner join users_roles using (rid) where";
    
    puts "Benutzer uebertragen"
    User.delete_all
    # Daten auslesen und einspielen
    mysql.query(user_query).each do |row|
      puts "Übertrage #{row['name']}"
      u = User.new
      u.username = row['name'].force_encoding("utf-8")
      u.old_password_hash = row['pass']
      u.password = (0...8).map{65.+(rand(25)).chr}.join # generate a random password
      u.avatar = File.open(row['picture']) unless row['picture'].nil? || row['picture'].empty?
      u.created_at = row['created']
      u.signature = row['signature']
      u.email = row['mail']
      
      u.roles = []
      mysql.query(user_role_query + " uid = '#{row['uid']}'").each do |rowr|
        u.roles << rowr['name']
      end
      
      mysql.query(user_personal_query + " and uid = #{row['uid']}").each do |rowp|
        case rowp['category']
        when 'Holarse Services'
          case rowp['title']
          when 'Minecraft'
            u.minecraft_active = true
          when 'Minecraft-Benutzername'
            u.minecraft_username = rowp['value']
          end
        when 'Kontakt'
          case rowp['title']
          when 'ICQ'
            u.icq = rowp['value']
          when 'Jabber'
            u.jabber = rowp['value']
          end
        when 'Persönliche Informationen'
          case rowp['title']
          when 'Beruf'
            u.job = rowp['value']
          when 'Stadt'
            u.city = rowp['value']
          end
        when 'Rechnerkonfiguration'
          case rowp['title']
          when 'Betriebssystem'
            u.distro = rowp['value']
          end
        end
      end
      u.save!
    end
  end

  task :news  => :environment do	   
    #
    # News auslesen
    #
    puts "Übertrage News"
    news_query = "select n.nid as nid, v.vid as vid, v.title as title, from_unixtime(n.created) as created_at, from_unixtime(v.timestamp) as updated_at, v.teaser as teaser, v.body as body, u.name as username from node n inner   join node_revisions v using (vid) inner join users u on u.uid = n.uid where n.type = 'story' order by created_at "

    comments_query = "select u.name as username, c.comment as content, c.hostname as hostname, from_unixtime(c.timestamp) as created_at from comments c inner join users u using (uid)"

    images_query = "select delta as position, filepath from content_field_screenshots inner join files on content_field_screenshots.field_screenshots_fid = files.fid where filepath is not null and vid ="
    files_query = "select filepath from content_field_attachments inner join files on content_field_attachments.field_attachments_fid = files.fid where vid ="
    videos_query = "select field_video_embed as video from content_field_video where field_video_embed is not null and vid = "

    voting_query = "select value, users.name as username from votingapi_vote inner join users using (uid) where uid > 0 and content_id =";
    homepage_query = "select * from content_field_homepage where field_homepage_value is not null and vid = ";

    News.delete_all
    mysql.query(news_query).each do |row|
      n = News.new
      n.title = row['title'].force_encoding("utf-8")
      n.created_at = row['created_at']
      puts "Übertrage #{n.created_at} #{n.title}"      
      n.updated_at = row['updated_at']
      n.content = row['body']
      n.author = User.find_by_slug(row['username'])
      # Comments
      n.comments = []
      mysql.query(comments_query + " where c.nid = '#{row['nid']}' order by c.timestamp asc").each do |rowc|
        c = Comment.new
        c.content = rowc['content']
        c.created_at = rowc['created_at']
        #	    	c.user = User.where(:username => rowc['username']).first
        c.author = rowc['username']

        n.comments << c
      end

      # Images
      n.screenshots = []
      mysql.query(images_query + " '#{row['vid']}'").each do |rowi|
        image = Screenshot.new
        image.img = File.open(rowi['filepath'])
        image.description = 'Importiert'
        image.position = rowi['position']
        n.screenshots << image
      end

      # File-attachments
      n.attachments = []
      mysql.query(files_query + " '#{row['vid']}'").each do |rowf|
        m = Fileattachment.new
        m.attachmentfile = File.open(rowf['filepath'])
        m.description = 'Importiert'

        n.attachments << m
      end

      # Videos
      n.videos = []
      mysql.query(videos_query + " '#{row['vid']}'").each do |rowv|
        m = Video.new(:url => rowv['video'], :description => '')

        n.videos << m
      end

      # News-Links
      n.links = []
      mysql.query(homepage_query + " #{row['vid']}").each do |rowweb|
        text = rowweb['field_homepage_value']
        link = Link.new(:url => text)

        n.links << link
      end

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