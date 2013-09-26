class NewsDecorator < Draper::Decorator
  delegate_all

  def category
    model.news_category ? model.news_category.description : ""
  end

  def type
    "News"
  end

  def title
    model.title
  end

  def titles
    [title, subtitle].join(",")
  end

  def intro
    model.subtitle
  end

  def teaser
    h.truncate(h.strip_tags(content), length: 500)
  end

  def content
#    Rails.cache.fetch "news-content-#{self.id}", expires_in: 1.minute do
      Holarse::Markup.render(model.content).html_safe
#    end
  end

  def has_comments?
    model.comments.length > 0
  end

end
