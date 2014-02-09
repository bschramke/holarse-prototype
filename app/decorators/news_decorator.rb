class NewsDecorator < BaseNodeDecorator
  delegate_all
  decorates_association :news_updates

  # hier muessen noch die news-update-autoren mit rein.
  def authors
    news_update_authors + super
  end

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
    h.is_youtube?(model.content) ? "" : super
  end

  def teaser_image
    h.is_youtube?(model.content) ? h.embed_youtube(model.content) : super
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

  def is_video_news?
    h.is_youtube?(model.content)
  end

  def type
    is_video_news? ? "die Videonews" : "die News"
  end

  private
 
  def news_update_authors
    NewsUpdate.where(news: model).pluck(:user_id).map { |uid| User.friendly.find(uid) }
  end


end
