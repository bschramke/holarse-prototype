class DiscountEventDecorator < Draper::Decorator
  delegate_all

  def title
    model.name
  end

  def intro
    model.startdate.present? ? "Ab #{l model.startdate, format: :date}" : ""
  end

  def teaser
    h.truncate(h.strip_tags(description), length: 200)
  end

  def description
#    Rails.cache.fetch "discount-event-content-#{self.id}", expires_in: 1.minute do
      Holarse::Markup.render(model.description).html_safe
#    end
  end

end
