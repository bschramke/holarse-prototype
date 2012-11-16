class NewsController < ApplicationController
  def index
    @news = News.desc(:created_at).limit(25)
  end

  def new
      @news = News.new
  end

  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html  { redirect_to(@news, :notice => 'News wurde erstellt.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  def update
    @old_news = News.find(params[:id])
    @news = @old_news.clone

    @old_news.historical = true
    @old_news.save

    @news.author = current_user

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
end
