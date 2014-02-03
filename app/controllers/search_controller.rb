# encoding: utf-8
class SearchController < ApplicationController

  before_filter :set_start_time

  add_breadcrumb "Suche"

  def show
    @searchword = params[:q] || params[:search][:q]
    @elements = search_content(@searchword)

    add_breadcrumb "Inhalte"
    add_breadcrumb @searchword, search_path(@searchword)
  end

  def tags
    @searchword = params[:q]
    @elements = search_for_tags(@searchword)
    
    add_breadcrumb "Tags"
    add_breadcrumb @searchword, searchtag_path(@searchword)
    render :show
  end

  #
  # schlägt artikel und news für die autovervollständigung vor
  #
  def suggest
    respond_to do |format|
      format.json { 
	render :json => suggestion(params[:term]).to_json
      }
    end
  end

  private

  def suggestion(term)
    search_content(term, 25)
    .map { |s| s.decorate}
    .map { |s| {  "title" => s.title,
		  "secondary_title" => s.secondary_title,
		  "icon" => s.icon,
		  "accuracy" => 0,
		  "url" => url_for(s)
	}
    }
  end

  def search_for_tags(searchword)
    News.tagged_with(searchword) + Article.tagged_with(searchword)
  end

  def search_content(searchword, limit=200)
    q = "%#{searchword}%"
    News.search(q, limit).decorate + Article.search(q, limit).decorate + DiscountEvent.search(q, limit).decorate
  end

  def set_start_time
    @search_start = Time.now
  end

end
