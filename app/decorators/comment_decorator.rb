class CommentDecorator < Draper::Decorator
  delegate_all

  def content
    Holarse::Markup.render(model.content).html_safe
  end

end
