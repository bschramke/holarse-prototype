class UserDecorator < Draper::Decorator
  delegate_all

  def avatar
    h.image_tag "http://lorempixel.com/320/200/people", class: "img-responsive media-object pull-right"
  end

  def signature
    model.signature.present? ? model.signature : ""
  end

  def unread_messages
    []
  end
  
  def roles
    model.roles.join[", "]
  end

  def comments
    Rails.cache.fetch "user-#{self.id}-comments", expires_in: 10.minutes do
      Comment.where(user_id: self).count
    end
  end

  def steam_path
    self.steam ? "http://steamcommunity.com/id/#{self.steam}" : ""
  end

  def minecraft_whitelisted?
    model.minecraft_whitelisted.present? && model.minecraft_whitelisted ? "ja" : "nein"
  end

end
