#encoding: utf-8
class WelcomeController < ApplicationController

  def index
    @news = latest_news.decorate
    Rails.logger.debug(@news)
  end

  private
  
  def do_load(type)
    Rails.cache.fetch type.to_s, expires_in: 1.minute do
      exec_load(type)
    end
  end
  
  def exec_load(type)
    send(type.to_s).map(&:decorate).sort(&chronological)[0..20]
  end

  def chronological
    lambda { |a,b| b.activity_changetime <=> a.activity_changetime }
  end

  #
  # willkommens-elemente
  #
  def welcome_elements
    latest_news + upcoming_discounts
  end
  
  def latest_news
    News.order("updated_at desc").limit(10)
  end
  
  def upcoming_discounts
    DiscountEvent.order("updated_at desc").limit(10)
  end

  #
  # letzte änderungen
  #
  def activity_elements
    latest_comments + latest_version_activities + latest_news_updates + latest_new_users
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

  def latest_article_updates
    Article.order("updated_at desc").limit(10)
  end

end