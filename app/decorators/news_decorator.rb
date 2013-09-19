class NewsDecorator < Draper::Decorator
  delegate_all

  def title
    model.title
  end

  def intro
    model.subtitle
  end

  def teaser
    model.content[0..200]
  end

end
