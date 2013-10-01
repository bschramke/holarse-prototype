class NewsDecorator < BaseNodeDecorator
  delegate_all

  def category
    model.news_category ? model.news_category.description : ""
  end

  def tags
    model.category_list
  end

  def secondary_title
    model.subtitle
  end

  def type
    "die News"
  end

end
