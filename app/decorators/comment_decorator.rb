class CommentDecorator < Draper::Decorator
  delegate_all

  def notice
    "#{h.link_user model.user} hat vor #{h.time_ago_in_words(model.updated_at)} einen #{h.link_comment "Kommentar", self} zu #{link_to_parent} geschrieben.".html_safe
  end

  def link_to_parent
    h.link_to model.commentable.decorate.title, model.commentable
  end

  def content
    Holarse::Markup.render(model.content).html_safe
  end

end
