# encoding: UTF-8
class VersionDecorator < Draper::Decorator
  delegate_all

  # die aenderung in einer zeile
  def notice
    "#{h.link_user blame_user} hat #{h.time_ago_in_words event_date} #{current.decorate.type} #{h.link_to current.title, current} #{activity_action}."
  end

  def blame_user
    User.find model.whodunnit
  end

  def event
    model.event
  end

  def event_date
    model.created_at
  end

  # alias fuer created_at, damit wir weiterhin sortieren koennen
  def updated_at
    event_date
  end

  def revision_index
    model.index
  end

  def title
    replayed.title
  end

  def secondary_title
    replayed.decorate.secondary_title
  end

  def content
    Holarse::Markup.render replayed.content
  end

  private

  def activity_action
    h.t("versions.state_verb.#{event}")
  end

  def replayed
    model.reify
  end

  def current
    model.item
  end

end
