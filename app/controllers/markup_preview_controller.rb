class MarkupPreviewController < ApplicationController
  def preview
    render :text => RedCloth.new(params[:content]).to_html
  end
end
