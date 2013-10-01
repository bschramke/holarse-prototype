class CommentDecorator < BaseNodeDecorator
  delegate_all

  def notice
    "#{h.link_user model.user} hat #{h.time_ago_in_words(model.updated_at)} einen #{h.link_comment "Kommentar", self} zu #{link_to_parent} geschrieben."
  end

  def link_to_parent
    h.link_to model.commentable.decorate.title, model.commentable
  end

  def title
    ""
  end

  def secondary_title
    ""
  end

end
