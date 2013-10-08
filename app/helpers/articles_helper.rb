module ArticlesHelper

  def project_activity_indicator(state, css_classes="")
    res = { "active" => "success", "pending" => "info", "inactive" => "warning", "dead" => "danger" }.fetch(state.code)
    content_tag :span, state.name, class: "label label-#{res} #{css_classes}"
  end

end
