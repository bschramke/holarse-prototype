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
    Holarse::Markup.render(model.description).html_safe
  end

end
