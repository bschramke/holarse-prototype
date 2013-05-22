class LinkGeneratorController < ApplicationController

  respond_to :json

  def index
    articles = Article.where(:enabled => true).select("title, id").order(:title)
    render :text => articles.to_json
  end
end
