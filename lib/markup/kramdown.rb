module Holarse
  module Markup
    require 'kramdown'
    def self.render(text, type = :html)
      Kramdown::Document.new(text).send("to_#{type}".to_sym)
    end
  end
end
