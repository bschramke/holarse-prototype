# encoding: UTF-8
# abstrakter decorator als basis für die grundobjekte Article, News, DiscountEvent, Comment
class BaseNodeDecorator < Draper::Decorator
  delegate_all

  def notice
    "#{h.link_user last_activity_user} hat #{h.time_ago_in_words last_activity_timestamp} #{type} #{h.link_to title, model} #{last_activity_action}"
  end

  def teaser
    h.truncate( h.strip_tags(content), length: 500 )
  end

  def title
    model.title
  end

  def titles
    [title, secondary_title].join ","
  end

  def content
    Holarse::Markup.render model.content
  end

  def last_activity_action
    latest_version ? h.t("versions.state_verb.#{latest_version.event}") : "angelegt"
  end

  def last_activity_timestamp
    latest_version ? latest_version.created_at : model.updated_at
  end

  def last_activity_user
    latest_version ? User.find(latest_version.whodunnit) : model.user
  end

  protected

  def latest_version
    model.versions.last
  end

end
