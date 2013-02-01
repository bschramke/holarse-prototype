module CommentsHelper

  def is_commentable?(obj)
    obj.commentable
  end

  # gibt an ob der benutzer ueberhaupt
  # kommentare schreiben darf
  def can_comment?(user=current_user)
    true
  end

  def show_commentbox(commentable_obj)
    return t('.login_required') if !is_logged_in?

    if can_comment? && is_commentable?(commentable_obj) 
      render :partial => "comments/new", :locals => { :commentable_object => commentable_obj, :comment => Comment.new }
    else
      t('.notcommentable')
    end  
  end

  def create_polymorphic_comment_link(action, commentable_object, comment)
    link_to t(".#{action}"), send("#{action}_#{commentable_object.class.to_s.underscore}_comment_path", commentable_object, comment)
  end

end
