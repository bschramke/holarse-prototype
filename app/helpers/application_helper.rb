require "lib/wiki"

module ApplicationHelper

  #
  # liefert die git-commit-version
  #
  def get_app_version
    Holarse::Application.config.app_version
  end

  #
  # parst einen text fuer die detail-darstellung
  #
  def wiki_detail(text)
    Holarse::Wiki::Parser.new.format_to_html(text, :user_links, :article_links, :external_links, :code).html_safe
  end

  #
  # parst einen text fuer die vorschau-darstellung
  #
  def wiki_preview(text)
    Holarse::Wiki::Parser.new.format_to_html(text, :preview)
  end

  #
  # verkuerzt einen text auf die angegebene laenge
  #
  def shorten(text, size=600)
    if text.length > size
      text[0..size] + "..."
    else
      text
    end
  end

end
