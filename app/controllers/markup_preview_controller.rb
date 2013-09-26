class MarkupPreviewController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:preview]  

  def preview
    render :text => Holarse::Markup.render(params[:content])
  end

  protected

  def update_user_activity
    # soll nicht als aktivitaet zaehlen
  end
end
