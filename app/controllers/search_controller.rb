class SearchController < ApplicationController

  before_filter :set_start_time

  def show
    @searchword = params[:search][:q]
    @elements = search_content
  end

  def tags
    @searchword = params[:q]
    @elements = search_for_tags
    
    render :show
  end

  private

  def search_for_tags
    [] + News.tagged_with(params[:q]) + Article.tagged_with(params[:q])
  end

  def search_content
    q = "%#{params[:search][:q]}"
    [] + News.where("content like ? or title like ? or subtitle like ?", q, q ,q) + Article.where("content like ? or title like ? or alternate_title like ?", q, q, q)
  end

  def set_start_time
    @search_start = Time.now
  end

end
