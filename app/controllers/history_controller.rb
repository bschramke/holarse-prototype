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
    @rev = @parent.versions[params[:id].to_i].decorate
    
    if !@rev
      flash[:info] = "Diese Revision konnte nicht gefunden werden."
      redirect_to root_path and return
    end

    add_breadcrumb @parent.class
    add_breadcrumb @parent.title, url_for(@parent)
    add_breadcrumb "Revisionen"
    add_breadcrumb @rev.index
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
