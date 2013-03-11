class WelcomeController < ApplicationController

  def index
    news = News.order("updated_at DESC")
    articles = Article.order("updated_at DESC")

    @elements = [] + news + articles
    @types = @elements.collect {|i| i.class.name.downcase }.uniq
  end

end
