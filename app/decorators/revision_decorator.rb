# encoding: UTF-8
class RevisionDecorator < Draper::Decorator
  delegate_all
  decorates_association :user

  # die aenderung in einer zeile
  def notice
    "#{user.link} hat #{current.type} #{h.link_to current.title, current} #{event_text}."
  end

  def author
    user.link
  end

  def activity_changetime
    model.updated_at || model.created_at
  end

  def changetime
    h.time_ago_in_words model.created_at
  end

  def teaser_image
    current.teaser_image
  end

  def event_text
    evt = model.event || "update"
    h.t("versions.events.#{evt}")
  end

  private

  def current
    model.historical.decorate
  end

end
