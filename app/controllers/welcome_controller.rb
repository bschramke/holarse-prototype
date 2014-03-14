class WelcomeController < ApplicationController

  def index
    @elements = Rails.cache.fetch "welcome-elements", expires_in: 1.minute do
      welcome_elements.map(&:decorate).sort(&chronological)[0..20]
    end
    @activities = Rails.cache.fetch "all-activities", expires_in: 1.minute do
      all_activities.map(&:decorate).sort(&chronological)[0..20]
    end

    #@tags = {
    #  :genres => Article.tag_counts_on(:genres),
    #  :categories => Article.tag_counts_on(:categories)
    #}
  end

  private

  def chronological
    lambda { |a,b| b.activity_changetime <=> a.activity_changetime }
  end

  def all_activities
    latest_comments + latest_version_activities + latest_news_updates + latest_new_users
  end

  def welcome_elements
    latest_news + upcoming_discounts
  end

  def latest_new_users
    User.order("created_at desc").limit(10)
  end

  def latest_news_updates
    NewsUpdate.order("created_at desc").limit(10)
  end

  def latest_version_activities
    Revision.order("created_at desc").limit(10)
  end

  def latest_comments
    Comment.order("updated_at desc").limit(10)
  end

  def upcoming_discounts
    DiscountEvent.order("updated_at desc").limit(10)
  end

  def latest_news
    News.order("updated_at desc").limit(10)
  end

  def latest_article_updates
    Article.order("updated_at desc").limit(10)
  end

end
