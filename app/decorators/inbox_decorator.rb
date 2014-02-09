class InboxDecorator < Draper::Decorator
  delegate_all

  def created_at
    h.time_ago_in_words model.created_at
  end

  def sender
    model.sender.blank? ? "anonym" : model.sender
  end

end
