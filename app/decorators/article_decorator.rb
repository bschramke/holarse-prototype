# encoding: UTF-8
class ArticleDecorator < Draper::Decorator
  delegate_all

  def tags
    model.genre_list + model.category_list
  end

  def title
    model.title
  end

  def type
    "Artikel"
  end

  def alternate_title
    model.alternate_title
  end

  def titles
    [title, alternate_title].join(",")
  end

  def intro
    ""
  end

  def teaser
    h.truncate(h.strip_tags(content), length: 500)
  end

  def content
#    Rails.cache.fetch "article-content-#{self.id}", expires_in: 1.minute do
      Holarse::Markup.render(model.content).html_safe
#    end
  end

end
