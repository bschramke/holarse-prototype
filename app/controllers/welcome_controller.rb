class WelcomeController < ApplicationController

  def index
    sorting = lambda { |a,b| b.updated_at <=> a.updated_at }
    @elements = decorate(all_elements).sort &sorting
    @activities = decorate(all_activities).sort &sorting
    @tags = {
      :genres => Article.tag_counts_on(:genres),
      :categories => Article.tag_counts_on(:categories)
    }
  end

  private

  def decorate(list)
    list.map(&:decorate)
  end

  def all_activities
    all_elements + latest_comments
  end

  def all_elements
    latest_news + latest_article_updates + upcoming_discounts
  end

  def latest_comments
    Comment.order("updated_at desc")
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

end
