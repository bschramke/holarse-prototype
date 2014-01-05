class DraftDecorator < Draper::Decorator
  delegate_all

  #
  # gibt den Dokumententyp aus
  #
  def type
    model.draftable.class
  end

  def source
    model.draftable
  end

  def merge_state
    if is_mergable?
      h.content_tag :span, class: "label label-success" do
	"Einspielbar"
      end
    else
      h.content_tag :span, class: "label label-danger" do
	"Veraltet"
      end
    end
  end

  private

  def is_mergable?
    model.draftable.updated_at <= model.updated_at
  end

end
