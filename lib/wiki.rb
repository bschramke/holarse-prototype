module Holarse
  module Wiki
    
    class Parser
      include Rails.application.routes.url_helpers

      def initialize(wikitext)
        @wikitext = wikitext
      end

      def format_to_html
        txt = @wikitext
        get_parse_types.each do |parsetype|
          txt = send(parsetype, txt)
        end
        txt
      end

      private

      def get_parse_types
        [:wiki_links, :external_links]
      end

      def plain(text)
        text
      end

      def external_links(text)
        text.gsub(/\[(.*) (.*)\]/) { |match|
          ActionController::Base.helpers.link_to("{$2}", "${1}")
        }
     end

      def wiki_links(text)
        text.gsub(/\[\[([\w \|]+)\]\]/) { |match|
          ActionController::Base.helpers.link_to("#{$1}", Rails.application.routes.url_helpers.articles_path("#{$1}".to_url) )
        }
      end

      def bla(text)
        "bla"
      end
    end

  end
end
