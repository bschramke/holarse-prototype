# encoding: UTF-8
class ArticleDecorator < BaseNodeDecorator
  delegate_all

  def icon
    "fa fa-gamepad"
  end

  def tags
    model.genre_list + model.category_list
  end

  def type
    "den Artikel"
  end

  def secondary_title
    model.alternate_title.blank? ? "" : model.alternate_title
  end

  def project_state
    h.project_activity_indicator(model.project_activity_state) if model.project_activity_state
  end

end
