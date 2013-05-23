class MarkupPreviewController < ApplicationController
  def preview
    render :text => Holarse::Markup.render(params[:content])
  end
end
