class HistoryController < ApplicationController
  def index
    Rails.logger.debug("Lade Revisionen von #{params[:news_id]}")
    @parent = params.has_key?(:news_id) ? News.find(params[:news_id]) : Article.find(params[:article_id])
    @revisions = @parent.archived
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
