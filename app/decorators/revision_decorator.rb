# encoding: UTF-8
class RevisionDecorator < Draper::Decorator
  delegate_all

  # die aenderung in einer zeile
  def notice
    "#{h.link_user user} hat #{h.time_ago_in_words model.created_at} #{current.decorate.type} #{h.link_to current.title, current} #{event_text}."
  end

  private

  def event_text
    evt = model.event || "update"
    h.t("versions.events.#{evt}")
  end

  def current
    model.historical
  end

end
