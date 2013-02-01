module CommentsHelper

  def is_commentable(obj)
    obj.commentable
  end

  def show_commentbox(commentable_obj)
    if is_commentable(commentable_obj)
      render :partial => "comments/new", :locals => { :commentable_object => commentable_obj, :comment => Comment.new }
    else
      t('.notcommentable')
    end  
  end

  def create_polymorphic_comment_link(action, commentable_object, comment)
    link_to t(".#{action}"), send("#{action}_#{commentable_object.class.to_s.underscore}_comment_path", commentable_object, comment)
  end

end
