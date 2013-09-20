module CommentsHelper

  def is_commentable?(obj)
    obj.commentable
  end

  def can_edit_comment?(comment)
    current_user == comment.user
  end

  def show_commentbox(commentable_obj)
    if !is_logged_in? 
      flash[:info] = "Bitte anmelden zum Kommentieren"
      return
    end

    if !is_commentable? commentable_obj
      flash[:info] = "Nicht kommentierbar"
      return
    end

    render :partial => "comments/new", :locals => { :commentable_object => commentable_obj, :comment => Comment.new }
  end

  def create_polymorphic_comment_link(action, commentable_object, comment)
    link_to t(".#{action}"), send("#{action}_#{commentable_object.class.to_s.underscore}_comment_path", commentable_object, comment)
  end

end
