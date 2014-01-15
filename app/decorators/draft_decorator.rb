class DraftDecorator < Draper::Decorator
  delegate_all

  #
  # gibt den Dokumententyp aus
  #
  def type
    model.draftable_type
  end

  def source
    model.draftable
  end

  def merge_state
    return h.content_tag :span, "neu", class: "label label-success" if not model.draftable_id.present?

    return h.content_tag :span, "einspielbar", class: "label label-info" if is_mergable?

    h.content_tag :span, "veraltet", class: "label label-danger"
  end

  private

  def is_mergable?
    !model.draftable.present? || model.draftable.updated_at <= model.updated_at
  end

end
