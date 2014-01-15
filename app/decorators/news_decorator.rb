class NewsDecorator < BaseNodeDecorator
  delegate_all

  def title_with_updates
    title + (model.news_updates.length > 0 ? " (Update Nr. #{model.news_updates.length})" : "" )
  end

  def icon
    "icon-bell"
  end

  def category
    model.news_category ? model.news_category.description : ""
  end

  def teaser
    h.is_youtube?(model.content) ? model.content : super
  end

  def teaser_image
    if h.is_youtube?(model.content)
      h.embed_youtube(model.content) 
    else
      super
    end
  end

  def tags
    model.category_list
  end

  def secondary_title
    model.subtitle
  end

  def content
    h.is_youtube?(model.content) ? h.embed_youtube(model.content) : super
  end

  def type
    "die News"
  end

end
