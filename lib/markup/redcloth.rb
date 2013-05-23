module Holarse
  module Markup
    def self.render(text, type = :html)
      RedCloth.new(text).send("to_#{type.to_s}").html_safe
    end
  end
end
