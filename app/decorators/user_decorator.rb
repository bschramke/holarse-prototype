class UserDecorator < Draper::Decorator
  delegate_all

  def teaser_image
    h.content_tag :img, nil, class: "img-responsive", "src" => "http://lorempixel.com/500/281/people/#{Random.rand(10)+1}", "alt" => "Generic image"
  end

  def notice
    "#{link} hat sich registriert."
  end

  def changetime
    h.time_ago_in_words model.created_at
  end

  def avatar
    h.image_tag model.avatar.url
  end

  def signature
    model.signature.present? ? model.signature : ""
  end

  def link
    h.link_user model
  end

  def unread_messages
    []
  end
  
  def roles
    model.roles.pluck(:name).map(&:capitalize).sort.join(", ")
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
