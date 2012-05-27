class NewsController < ApplicationController
  def index
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
