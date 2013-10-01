# encoding: UTF-8
class ArticleDecorator < BaseNodeDecorator
  delegate_all

  def tags
    model.genre_list + model.category_list
  end

  def type
    "den Artikel"
  end

  def secondary_title
    model.alternate_title
  end

end
