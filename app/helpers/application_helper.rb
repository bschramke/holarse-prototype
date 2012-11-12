require "lib/wiki"

module ApplicationHelper

  def get_app_version
    Holarse::Application.config.app_version
  end

  def wiki_to_html(text)
    Holarse::Wiki::Parser.new(text).format_to_html
  end

end
