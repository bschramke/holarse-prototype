class CommentDecorator < Draper::Decorator
  delegate_all

  def content
    Holarse::Markup.render(model.content.force_encoding('utf-8')).html_safe
  end

end
