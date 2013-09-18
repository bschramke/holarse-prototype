module ArticlesHelper

  def article_authors(article)
    article.versions.map { |version| version.whodunnit }.uniq.map { |userid| User.find userid }.sort { |x, y| x.username <=> y.username }
  end

  def create_author_list(article)
    article_authors(article).map { |author| link_user author }.join(", ").html_safe
  end

end
