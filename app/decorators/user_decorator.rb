class UserDecorator < Draper::Decorator
  delegate_all

  def signature
    model.signature.present? ? model.signature : ""
  end

  def unread_messages
    []
  end

  def comments
    Rails.cache.fetch "user-#{self.id}-comments", expires_in: 10.minutes do
      Comment.where(user_id: self).count
    end
  end

  def steam_path
    self.steam ? "http://steamcommunity.com/id/#{self.steam}" : ""
  end

end
