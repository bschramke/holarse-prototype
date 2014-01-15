#encoding: utf-8
class NewsUpdatesController < ApplicationController

  add_breadcrumb "News"

  def new
    @news = News.find(params[:news_id])
    add_breadcrumb @news.title, @news
    add_breadcrumb "Neues Update"
    @news_update = NewsUpdate.new
    render :edit
  end

  def create
    @news = News.find(params[:news_id])
    @news_update = NewsUpdate.new(news_update_params)

    @news_update.user = current_user
    @news_update.news = @news

    if @news_update.save
      flash[:success] = "Das Update wurde angehangen"
      redirect_to @news
    else
      flash[:fatal] = "Das Update konnte nicht gespeichert werden."
      redirect_to :back
    end
  end

  private

  def news_update_params
    params.require(:news_update).permit(:content)
  end

end
