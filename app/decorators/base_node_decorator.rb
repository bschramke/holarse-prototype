# encoding: UTF-8
# abstrakter decorator als basis für die grundobjekte Article, News, DiscountEvent, Comment
class BaseNodeDecorator < Draper::Decorator
  delegate_all

  def teaser
    h.truncate( h.strip_tags(content), length: 500 )
  end

  def teaser_image
    h.content_tag :img, nil, class: "img-responsive", "src" => "http://lorempixel.com/500/281/technics/#{Random.rand(10)+1}", "alt" => "Generic image"
  end

  def authors_list
    authors.uniq.sort { |x,y| x.username.downcase <=> y.username.downcase }.map { |author| h.link_user author }.join(", ")
  end

  def title
    model.title
  end

  def titles
    [title, secondary_title].join ","
  end

  def content
    Holarse::Markup.render model.content
  end

  protected

  def authors
    model.revisions.pluck(:user_id).uniq.map { |uid| User.find(uid) }
  end

end
