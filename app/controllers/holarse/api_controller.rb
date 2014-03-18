class Holarse::ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:markup_preview, :site_statistics]

  respond_to :json

  def grab_title
    raise "no url given" if params[:url].empty?

    title = Mechanize.new.get(params[:url]).title
    Rails.logger.debug("Grabbing title for #{params[:url]} => #{title}")
    render :text => {
      title: title
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

  def discount_count
    render text: cached_model_count(DiscountEvent).to_json
  end

  def inbox_count
    render text: cached_model_count(Inbox).to_json
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

  def cached_model_count(model)
    count = Rails.cache.fetch "#{model.to_s.downcase}-count", expires_in: 1.minute do
      {
	count: model.all.count
      }
    end
  end

  def taglist_by_context(context, searchword="")
    ActsAsTaggableOn::Tagging.joins("inner join tags on tags.id = tag_id").where(context: context).where("tags.name like ?", "%#{searchword}%").select("tags.name").map(&:name).uniq
  end

  def update_user_activity
    # soll nicht als aktivitaet zaehlen, daher wird
    # die methode hier ueberschrieben
  end

end
