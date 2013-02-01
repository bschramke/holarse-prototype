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

end
