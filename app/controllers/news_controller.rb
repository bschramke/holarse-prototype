class NewsController < ApplicationController

  before_filter :require_edit_permissions, :only => [:edit, :update, :destroy]

  def index
    @news = News.order('created_at DESC').limit(25)
  end

  def new
    @news = News.new
    @news.links.build
    @news.screenshots.build
    @news.tag_list = "News"
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
    @old_news = @news.clone

    #@old_news.historical = true
    @old_news.save

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
    @news = News.find params[:id]
  end

  def edit
    @news = News.find params[:id]
  end
  
  private

  def require_edit_permissions
    unless has_role('admin', 'reporter')
      flash[:warning] = "Es werden erweiterte Rechte ben&ouml;tigt, um diese News bearbeiten zu k&ouml;nnen."
      redirect_to news_path
    end 
  end

end
