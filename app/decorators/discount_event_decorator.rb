class DiscountEventDecorator < BaseNodeDecorator
  delegate_all

  def intro
    model.startdate.present? ? "Ab #{l model.startdate, format: :date}" : ""
  end

  def type
    "die Rabattmeldung"
  end

  def secondary_title
    ""
  end

end
