require "lib/wiki"

module ApplicationHelper

  #
  # liefert die git-commit-version
  #
  def get_app_version
    Holarse::Application.config.app_version
  end

  #
  # rendert einen text
  #
  def render_markup(text, type = :html)
    RedCloth.new(text).send("to_#{type.to_s}").html_safe
  end

end

