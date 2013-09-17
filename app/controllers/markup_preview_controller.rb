class MarkupPreviewController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:preview]  

  def preview
    render :text => Holarse::Markup.render(params[:content])
  end
end
