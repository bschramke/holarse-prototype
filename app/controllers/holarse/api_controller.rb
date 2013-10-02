class Holarse::ApiController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:markup_preview]

  respond_to :json

  def autolinkable
    render :text => Holarse::Api::Autolinkable.new.create_title_list(Article.select("title, alternate_title, id")).to_json    
  end

  def discount_count
    render :text => DiscountEvent.all.count
  end

  def markup_preview
    render :text => Holarse::Markup.render( params[:content] )
  end

  def minecrafters
    render :text => User.minecrafters.to_json(only: :minecraft_username)    
  end

  protected

  def update_user_activity
    # soll nicht als aktivitaet zaehlen, daher wird
    # die methode hier ueberschrieben
  end

end
