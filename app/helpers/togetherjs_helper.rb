module TogetherjsHelper

  def user_wants_to_collaborate?(user)
    user && user.collaborate
  end

  def togetherjs_button
    content_tag :button, "Penguins unite!", class: "btn btn-default btn-primary", onclick: "TogetherJS(this); return false;" if user_wants_to_collaborate?(current_user)
  end
end
