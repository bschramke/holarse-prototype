class CommentDecorator < BaseNodeDecorator
  delegate_all

  def notice
    "#{h.link_user model.user} hat #{h.time_ago_in_words(model.updated_at)} einen #{h.link_comment "Kommentar", self} f&uuml;r #{parent.type} #{link_to_parent} geschrieben."
  end

  def link_to_parent
    h.link_to parent.title, parent
  end

  def title
    ""
  end

  def secondary_title
    ""
  end

  protected

  def parent
    model.commentable.decorate
  end

end
