class LinkGeneratorController < ApplicationController

  respond_to :json

  def index
    articles = Article.select("title, alternate_title, id").order(:title)

    titles_list = Rails.cache.fetch "articles-list", expires_in: 5.minutes do
      create_title_list(articles).to_json
    end
    render :text => titles_list
  end

  private

  def create_title_list(articles)
    clean combine_titles(articles)
  end

  def combine_titles(articles)
    articles.map(&to_title_objects) + articles.map(&to_alternate_title_objects)
  end

  def clean(articles)
    articles.delete_if &misses_title
  end

  def to_title_objects
    Proc.new {|o| { :id => o.id, :title => o.title } }
  end

  def to_alternate_title_objects
    Proc.new {|o| { :id => o.id, :title => o.alternate_title } }
  end

  def misses_title
    Proc.new {|i| i[:title].nil? || i[:title].empty? }
  end

end
