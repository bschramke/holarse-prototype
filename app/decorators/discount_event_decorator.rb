class DiscountEventDecorator < Draper::Decorator
  delegate_all

  def notice
    "#{h.link_user model.user} hat vor #{h.time_ago_in_words(model.updated_at)} die Rabattaktion #{link_to_parent} #{state_verb}.".html_safe
  end

  def title
    model.name
  end

  def intro
    model.startdate.present? ? "Ab #{l model.startdate, format: :date}" : ""
  end

  def teaser
    h.truncate(h.strip_tags(description), length: 500)
  end

  def description
#    Rails.cache.fetch "discount-event-content-#{self.id}", expires_in: 1.minute do
      Holarse::Markup.render(model.description).html_safe
#    end
  end

  def link_to_parent
    h.link_to title, model
  end

  private

  def state_verb
    "angelegt"
    #h.t "versions.state_verb.#{model.versions.last.event}"
  end

end
