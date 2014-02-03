#encoding: utf-8
class NewsUpdateDecorator < BaseNodeDecorator
  delegate_all

  def notice
    "#{user.link} hat ein #{h.link_to "Update", h.news_news_update_path(model.news, model)} für die News #{h.link_to model.news.title, model.news} geschrieben."
  end

  def content
    super.html_safe
  end

end
