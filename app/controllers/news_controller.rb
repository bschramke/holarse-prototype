class NewsController < ApplicationController

  before_filter :require_edit_permissions, :except => [:index, :show]

  add_breadcrumb "News"

  def index
    @news = News.order('created_at DESC').limit(25)
  end

  def new
    @news = News.new
    render :edit
  end

  def create
    @news = News.new(params[:news])
    @news.user = current_user

    respond_to do |format|
      if @news.save
        format.html  { redirect_to(@news, :notice => 'News wurde erstellt.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  def update
    @news = News.find(params[:id])
    @news.user = current_user

    respond_to do |format|
    if @news.update_attributes(params[:news])
      format.html  { redirect_to(@news, :notice => 'News wurde aktualisiert.') }
    else
      format.html  { render :action => "edit" }
    end
  end
  end

  def destroy
  end

  def show
    @news = News.find(params[:id]).decorate
    add_breadcrumb @news.title, news_path(@news)
  end

  def edit
    @news = News.find params[:id]
  end
  
  private

  def require_edit_permissions
    unless has_role('admin', 'reporter')
      flash[:info] = "Sie m&uuml;ssen Reporter sein, um an den News arbeiten zu k&ouml;nnen."
      redirect_to news_index_path
    end 
  end

end
