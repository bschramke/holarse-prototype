#encoding: utf-8
class NewsUpdatesController < ApplicationController

  add_breadcrumb "News"

  def index
    @news = load_news
    add_breadcrumb @news.title, @news
    add_breadcrumb "Updates"
    add_breadcrumb "Übersicht"
    @news_updates = @news.news_updates.decorate
  end

  def show
    @news = load_news
    add_breadcrumb @news.title, @news
    add_breadcrumb "Updates"
    @news_update = NewsUpdate.find(params[:id]).decorate
    add_breadcrumb @news_update.id
  end

  def update
    @news = load_news
    @news_update = NewsUpdate.find(params[:id])
    @news_update.user = current_user

    @news_update.assign_attributes(news_update_params)

    @news_update.save

    redirect_to @news
  end

  def edit
    @news = load_news
    add_breadcrumb @news.title, @news
    add_breadcrumb "Updates"
    @news_update = NewsUpdate.find(params[:id])
    add_breadcrumb @news_update.id
    add_breadcrumb "Bearbeiten"
  end

  def new
    @news = load_news
    add_breadcrumb @news.title, @news
    add_breadcrumb "Updates"
    add_breadcrumb "Neues Update"
    @news_update = NewsUpdate.new
    render :edit
  end

  def create
    @news = load_news
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

  def load_news
    News.friendly.find(params[:news_id]).decorate
  end

end
