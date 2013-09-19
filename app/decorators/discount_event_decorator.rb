class DiscountEventDecorator < Draper::Decorator
  delegate_all

  def title
    model.name
  end

  def intro
    "Ab #{model.startdate}"
  end

  def teaser
    h.truncate(h.strip_tags(Holarse::Markup.render(model.description)), length: 200)
  end

end
