class NewsDecorator < Draper::Decorator
  delegate_all

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
    model.content[0..200]
  end

  def content
    Holarse::Markup.render(model.content).html_safe
  end

end
