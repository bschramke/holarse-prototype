class WelcomeController < ApplicationController

  def index
    sorting = lambda { |a,b| b.updated_at <=> a.updated_at }

    @elements = decorate(welcome_elements).sort &sorting
    @activities = decorate(all_activities).sort &sorting

    #@tags = {
    #  :genres => Article.tag_counts_on(:genres),
    #  :categories => Article.tag_counts_on(:categories)
    #}
  end

  private

  def decorate(list)
    list.map(&:decorate)
  end

  def all_activities
    latest_comments + latest_version_activities
  end

  def welcome_elements
    latest_news + upcoming_discounts
  end

  def latest_version_activities
    PaperTrail::Version.order("created_at desc").limit(100)
  end

  def latest_comments
    Comment.order("updated_at desc").limit(100)
  end

  def upcoming_discounts
    DiscountEvent.order("updated_at desc").limit(20)
  end

  def latest_news
    News.order("updated_at desc").limit(20)
  end

  def latest_article_updates
    Article.order("updated_at desc")
  end

end
