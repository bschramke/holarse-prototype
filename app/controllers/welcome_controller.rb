#encoding: utf-8
class WelcomeController < ApplicationController
  
  def index
    @article_updates = Article.order("updated_at desc").limit(10).decorate
  end

end