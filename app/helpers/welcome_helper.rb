module WelcomeHelper

  #
  # wandelt ein beliebiges objekt in ein isotope-datencontainer um
  #
  def isotopify(object)
    content_tag :div, :class => "item #{object.class.name.downcase}" do
      html = content_tag :p, object.title, :class => "title" if object.respond_to?(:title)
      html += content_tag :p, object.user.username, :class => "author" if object.respond_to?(:user)
      html += content_tag :p, object.comments.length, :class => "comments" if object.respond_to?(:comments)

      html += content_tag :p, object.created_at, :class => "createdat"
      html += content_tag :p, shorten(wiki_preview(object.content), 150), :class => "teaser" if object.respond_to?(:content)
    end
  end

end
