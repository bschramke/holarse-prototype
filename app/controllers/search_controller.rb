class SearchController < ApplicationController
  def show
    @search_start = Time.now
    @news = News.search(params[:q])
  end
end
