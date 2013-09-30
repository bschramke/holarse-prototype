class WelcomeController < ApplicationController

  def index
    @elements = all_elements
    @activities = all_activities.sort { |a,b| b.updated_at <=> a.updated_at }
    @tags = {
      :genres => Article.tag_counts_on(:genres),
      :categories => Article.tag_counts_on(:categories)
    }
  end

  private

  def all_activities
    all_elements + latest_comments.decorate
  end

  def all_elements
    latest_news.decorate + latest_article_updates.decorate + upcoming_discounts.decorate
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
