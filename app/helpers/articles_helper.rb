module ArticlesHelper

  def article_authors(article)
    article.versions.map { |version| version.whodunnit }.uniq.map { |userid| User.find userid }.sort { |x, y| x.username <=> y.username }
  end

end
