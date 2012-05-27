class SearchController < ApplicationController
  def show
    @news = News.search(params[:q])
  end
end
