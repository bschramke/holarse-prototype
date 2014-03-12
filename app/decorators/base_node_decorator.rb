# encoding: UTF-8
# abstrakter decorator als basis für die grundobjekte Article, News, DiscountEvent, Comment
class BaseNodeDecorator < Draper::Decorator
  delegate_all
  decorates_association :user
  decorates_association :comments

  def author
    user.link
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
		 .join(",")
		 .html_safe
  end

  def title
    model.title.blank? ? "" : model.title
  end

  def titles
    [title, secondary_title].join ","
  end

  def content
    Holarse::Markup.render(model.content)
  end

  def changetime
    h.time_ago_in_words model.updated_at
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

end
