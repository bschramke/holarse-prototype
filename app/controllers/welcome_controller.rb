class WelcomeController < ApplicationController

  def index
    news = News.order("updated_at DESC").where(:enabled => true)
    articles = Article.order("updated_at DESC").where(:enabled => true)

    @elements = [] + news + articles
    @types = @elements.collect {|i| i.class.name.downcase }.uniq
  end

end
