# encoding: UTF-8
class VersionDecorator < Draper::Decorator
  delegate_all

  def blame_user
    User.find model.whodunnit
  end

  def event
    model.event
  end

  def event_date
    model.created_at
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

  def replayed
    model.reify
  end

end
