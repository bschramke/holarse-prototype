module TogetherHelper

  def togetherjs_button
    content_tag :button, "Penguins unite!", class: "btn btn-default btn-primary", onclick: "TogetherJS(this); return false;"
  end

end
