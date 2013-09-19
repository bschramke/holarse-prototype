class SearchController < ApplicationController

  before_filter :set_start_time

  add_breadcrumb "Suche"

  def show
    @searchword = params[:q] || params[:search][:q]
    @elements = search_content @searchword

    add_breadcrumb "Inhalte"
    add_breadcrumb @searchword, search_path(@searchword)
  end

  def tags
    @searchword = params[:q]
    @elements = search_for_tags @searchword
    
    add_breadcrumb "Tags"
    add_breadcrumb @searchword, searchtag_path(@searchword)
    render :show
  end

  private

  def search_for_tags(searchword)
    News.tagged_with(searchword).decorate + Article.tagged_with(searchword).decorate
  end

  def search_content(searchword)
    q = "%#{searchword}"
    News.where("content like ? or title like ? or subtitle like ?", q, q ,q).decorate + Article.where("content like ? or title like ? or alternate_title like ?", q, q, q).decorate
  end

  def set_start_time
    @search_start = Time.now
  end

end
