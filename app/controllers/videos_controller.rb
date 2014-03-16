class VideosController < ApplicationController

  def create
    Rails.logger.debug(params.inspect)
    @entity = find_entity
    @video = Video.new(video_params)
    @entity.videos << @video

    redirect_to @entity
  end

  private

  def find_entity
    return Article.friendly.find(params[:article_id]) if params[:article_id].present?
    return News.friendly.find(params[:news_id]) if params[:news_id].present?
  end

  def video_params
    params.require(:video).permit(:url)
  end

end
