class HistoryController < ApplicationController
  def index
    @parent = get_object
    Rails.logger.debug("Lade Revisionen von #{@parent.id}")
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

  private

  def get_object
    params.has_key?(:news_id) ? News.find(params[:news_id]) : Article.find(params[:article_id])
  end
end
