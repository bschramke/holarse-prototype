class WelcomeController < ApplicationController

  def index
    @elements = all_elements
    @types = extract_uniq_types_of @elements
    @tags = {
      :genres => Article.tag_counts_on(:genres),
      :categories => Article.tag_counts_on(:categories)
    }
  end

  private

  def all_elements
    latest_news.decorate + latest_article_updates.decorate + upcoming_discounts.decorate
  end

  def upcoming_discounts
    DiscountEvent.order("updated_at desc")
  end

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
