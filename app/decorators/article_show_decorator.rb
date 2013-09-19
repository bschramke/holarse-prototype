class ArticleShowDecorator < Draper::Decorator
  delegate_all

  def title
    model.title
  end

  def alternate_title
    model.alternate_title
  end

  def content
    Holarse::Markup.render(model.content).html_safe
  end

end
