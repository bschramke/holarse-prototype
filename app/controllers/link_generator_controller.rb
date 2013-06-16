class LinkGeneratorController < ApplicationController

  respond_to :json

  def index
    articles = Article.select("title, alternate_title, id").order(:title)
    joined_res = articles.map { |o| { :id => o.id, :title => o.title } } + articles.map { |i| { :id => i.id, :title => i.alternate_title} }
    render :text => joined_res.to_json
  end
end
