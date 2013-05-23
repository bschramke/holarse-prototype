module Holarse
  module Markup
    require 'kramdown'
    def self.render(text, type = :html)
      Kramdown::Document.new(text).to_html.html_safe
    end
  end
end
