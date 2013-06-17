class WelcomeController < ApplicationController

  def index
    @elements = latest_news + latest_article_updates
    @types = extract_uniq_types_of @elements
    @tags = {
      :genres => Article.tag_counts_on(:genres),
      :categories => Article.tag_counts_on(:categories)
    }
  end

  private

  def latest_news
    News.order("updated_at desc")
  end

  def latest_article_updates
    Article.order("updated_at desc")
  end

  def extract_uniq_types_of(elements)
    elements.collect { |i| i.class.name.underscore.downcase }.uniq
  end

end
