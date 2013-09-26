module ArticlesHelper

  def article_authors(article)
    article.versions.map { |version| version.whodunnit }.uniq.map { |userid| User.find userid }.sort { |x, y| x.username <=> y.username }
  end

  def create_author_list(article)
    article_authors(article).map { |author| link_user author }.join(", ").html_safe
  end

  def project_activity_indicator(state, css_classes="")
    res = { "active" => "success", "pending" => "info", "inactive" => "warning", "dead" => "danger" }.fetch(state.code)
    content_tag :span, state.name, class: "label label-#{res} #{css_classes}"
  end

end
