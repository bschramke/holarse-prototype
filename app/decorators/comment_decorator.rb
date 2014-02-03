class CommentDecorator < BaseNodeDecorator
  delegate_all

  def notice
    "#{author} hat einen #{h.link_comment "Kommentar", self} f&uuml;r #{parent.type} #{link_to_parent} geschrieben."
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

  def content
    super.html_safe
  end

  protected

  def parent
    model.commentable.decorate
  end

end
