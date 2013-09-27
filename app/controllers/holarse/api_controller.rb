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
    Rails.logger.debug("Incoming: #{params[:content]}")
    outcome = Holarse::Markup.render(params[:content])
    Rails.logger.debug("Outcoming: #{outcome}")
    render :text => Holarse::Markup.render(outcome)
  end

  protected

  def update_user_activity
    # soll nicht als aktivitaet zaehlen
  end

end
