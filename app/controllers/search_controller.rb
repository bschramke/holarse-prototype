class SearchController < ApplicationController
  def show
    @search_start = Time.now

    @news = News.search(:tags, params[:q])
  end

  def tags
    @search_start = Time.now
    @news = News.search(:tags, params[:q])

    render :show
  end

end
