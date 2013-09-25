class UserDecorator < Draper::Decorator
  delegate_all

  def signature
    model.signature.present? ? model.signature : ""
  end

  def unread_messages
    []
  end

  def comments
    Comment.where(user_id: self).count
  end

end
