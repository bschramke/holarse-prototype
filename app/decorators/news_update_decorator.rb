#encoding: utf-8
class NewsUpdateDecorator < BaseNodeDecorator
  delegate_all

  def notice
    "#{h.link_user model.user} hat ein #{h.link_to "Update", h.news_news_update_path(model.news, model)} für die News #{h.link_to model.news.title, model.news} geschrieben."
  end

  def changetime
    "#{h.time_ago_in_words model.created_at}"
  end

end
