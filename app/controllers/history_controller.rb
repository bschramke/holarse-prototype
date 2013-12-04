class HistoryController < ApplicationController

  def index
    @parent = get_object
    @revisions = @parent.revisions.reverse

    add_breadcrumb @parent.class
    add_breadcrumb @parent.id, url_for(@parent)
    add_breadcrumb "Revisionen"
  end

  def show
    @parent = get_object
    @revision = Revision.find(params[:id]).decorate
    @original = @revision.original.decorate
    
    if !@revision
      flash[:info] = "Diese Revision konnte nicht gefunden werden."
      redirect_to root_path and return
    end

    add_breadcrumb @parent.class
    add_breadcrumb @parent.title, url_for(@parent)
    add_breadcrumb "Revisionen"
    add_breadcrumb @revision.id
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
