# encoding: UTF-8
class ArticleDecorator < Draper::Decorator
  delegate_all

  def notice
    "#{h.link_history_user latest_version} hat #{h.time_ago_in_words(model.updated_at)} den Artikel #{link_to_parent} #{state_verb}.".html_safe
  end

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

  def link_to_parent
    h.link_to title, model
  end

  private

  def state_verb
   h.t "versions.state_verb.#{latest_version.event}"
  end

  def latest_version
    model.versions.last
  end

end
