# encoding: UTF-8
# abstrakter decorator als basis für die grundobjekte Article, News, DiscountEvent, Comment
class BaseNodeDecorator < Draper::Decorator
  delegate_all
  decorates_association :user
  decorates_association :comments

  def activity_changetime
    model.updated_at || model.created_at
  end

  def author
    user.link
  end

  def link_to
    h.url_for(model)
  end

  def teaser(highlight=nil)
    h.highlight(
      h.truncate( h.strip_tags(content), length: 500 ), 
      highlight
    )
  end

  def teaser_image
    h.content_tag :img, nil, class: "img-responsive", "src" => "http://lorempixel.com/500/281/technics/#{Random.rand(10)+1}", "alt" => "Generic image"
  end

  def authors_list
    UserDecorator.decorate_collection( authors.uniq.sort(&by_username) )
		 .map(&link_users)
		 .join(", ")
		 .html_safe
  end

  def title
    model.title.blank? ? "" : model.title
  end

  def titles
    [title, secondary_title].join ","
  end

  def content
    Rails.cache.fetch "#{model.class.name.downcase}-#{model.id}-#{activity_changetime.to_i}-content", expires_in: 10.minute do
      autolink( Holarse::Markup.render(model.content) )
    end
  end

  protected

  def link_users
    lambda {|u| u.link}
  end

  def authors
    model.revisions.pluck(:user_id).uniq.map { |uid| User.friendly.find(uid) }
  end

  def by_username
    lambda { |x,y| x.username.downcase <=> y.username.downcase }
  end

  def autolink(text)
    Article.title_list.delete_if(&is_current_article).each do |article|
      text.gsub!(/\s(#{article.title})\s/i, " #{h.link_to(article.title, article)} ")
    end
    text
  end

  def is_current_article
    lambda { |a| ([title.downcase, secondary_title.downcase] & [a.title.downcase]).present? } 
  end

end
