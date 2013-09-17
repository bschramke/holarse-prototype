class HistoryController < ApplicationController

  add_breadcrumb "Home", :root_path
  
  def index
    @parent = get_object
    Rails.logger.debug("Lade Revisionen von #{@parent.id}")
    @revisions = @parent.versions

    add_breadcrumb @parent.class
    add_breadcrumb @parent.id, url_for(@parent)
    add_breadcrumb "Revisionen"
  end

  def show
    @parent = get_object
    @revision = @parent.versions.find(params[:id])

    add_breadcrumb @parent.class
    add_breadcrumb @parent.title, url_for(@parent)
    add_breadcrumb "Revisionen"
    add_breadcrumb params[:id]
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
