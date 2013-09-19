class ArticleDecorator < Draper::Decorator
  delegate_all

  def title
    model.title
  end

  def intro
    ""
  end

  def teaser
    h.truncate(h.strip_tags(Holarse::Markup.render(model.content)), length: 200)
  end

end
