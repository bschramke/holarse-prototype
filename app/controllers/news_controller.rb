class NewsController < ApplicationController
  def index
    @news = News.desc(:created_at).limit(25)
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
    @news = News.find_by_slug(params[:id])
  end

  def edit
  end
end
