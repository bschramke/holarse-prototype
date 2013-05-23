module Holarse
  module Markup
    def self.render(text, type = :html)
      WikiCloth::Parser.new({:data => text}).to_html.html_safe
    end
  end
end
