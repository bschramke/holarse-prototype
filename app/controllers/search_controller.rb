class SearchController < ApplicationController

  before_filter :set_start_time

  def show
    @searchword = params[:search][:q]
    q = "%#{@searchword}%"
    @elements = News.where("content like ? or title like ?", q, q)
  end

  def tags
    @search_start = Time.now
    @news = News.search(:tags, params[:q])

    render :show
  end

  def set_start_time
    @search_start = Time.now
  end

end
