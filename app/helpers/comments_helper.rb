module CommentsHelper

  def is_commentable?(obj)
    obj.comments_allowed
  end

  def can_edit_comment?(comment)
    current_user == comment.user
  end

  def show_commentbox(commentable)
    if !is_logged_in? 
      return content_tag :p, "Bitte zum Kommentieren zuerst einloggen", class: "text-warning"
    end

    if !is_commentable? commentable
      return content_tag :p, "Kommentarfunktion deaktiviert", class: "text-info"
    end

    render :partial => "comments/new", :locals => { :commentable => commentable }
  end

  def link_comment(text, comment)
    link_to text, url_for(comment.commentable) + "#comment-#{comment.id}"
  end

  def create_polymorphic_comment_link(action, commentable_object, comment)
    link_to t(".#{action}"), send("#{action}_#{commentable_object.class.to_s.underscore}_comment_path", commentable_object, comment)
  end

end
