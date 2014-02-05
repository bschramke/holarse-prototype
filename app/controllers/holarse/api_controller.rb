class Holarse::ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:markup_preview, :site_statistics]

  respond_to :json

  def autolinkable
    articles = Article.select("title, alternate_title, id")
    a = articles.map { |a| { :id => a.id, :title => a.title } }
    b = articles.map { |a| { :id => a.id, :title => a.alternate_title } }
		.reject { |a| a[:title].nil? || a[:title].empty? } # leere title rauswerfen
		.collect { |g| # multiple alternativartikel in einzelobjekte aufsplitten
		    c = []
	            g[:title].split(",").each do |n|
			c << { :id => g[:id], :title => n.strip }
		    end
		    c
	         }.flatten

    result = (a + b).sort { |a,b| a[:id] <=> b[:id] }
    render :text => result.to_json
  end

  def discount_count
    render :text => { 
      count: DiscountEvent.all.count
    }.to_json
  end

  def markup_preview
    render :text => Holarse::Markup.render( params[:content] )
  end

  def minecrafters
    render :text => User.minecrafters.to_json(only: :minecraft_username)    
  end

  def site_statistics
    stats = {
      "stats" => [
	{ "name" => "Artikel", 
	  "icon" => "fa fa-gamepad",
	  "count" => Article.count.to_json 
	},
	{ "name" => "Kommentare", 
	  "icon" => "fa fa-comments",
	  "count" => Comment.count.to_json 
	},
	{ "name" => "News", 
	  "icon" => "fa fa-bell",
	  "count" => News.count.to_json 
	},
	{ "name" => "Benutzer", 
	  "icon" => "fa fa-group",
	  "count" => User.count.to_json 
	}
    ]}

    render :text => stats.to_json
  end

  def taglist
    render :text => taglist_by_context(params[:context], params[:term])
  end

  def mumble
    count = Rails.cache.fetch "mumble-count", expires_in: 1.minute do
      {
	url: Holarse::Application.config.mumbleurl,
	count: Holarse::Mumble.count
      }
    end

    render :text => count.to_json
  end

  protected

  def taglist_by_context(context, searchword="")
    ActsAsTaggableOn::Tagging.joins("inner join tags on tags.id = tag_id").where(context: context).where("tags.name like ?", "%#{searchword}%").select("tags.name").map(&:name).uniq
  end

  def update_user_activity
    # soll nicht als aktivitaet zaehlen, daher wird
    # die methode hier ueberschrieben
  end

end
