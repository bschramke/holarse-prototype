module Holarse
  module Wiki
    
    class Parser
      include Rails.application.routes.url_helpers
      include ActionView::Helpers::TagHelper
      include ActionView::Context

      def format_to_html(wikitext, *parsetypes)
        txt = wikitext
        parsetypes.each do |parsetype|
          txt = send(parsetype, txt)
        end
        txt
      end

      private

      #
      # Ein Rohtext-Formatierer
      #
      def plain(text)
        text
      end

      #
      # Formatiert externe Links
      #
      def external_links(text)
        text.gsub(/\[(.*) (.*)\]/) { |match|
          ActionController::Base.helpers.link_to("#{$2}", "#{$1}")
        }
      end

      #
      # Formatiert interne Wiki-Links
      #
      def article_links(text)
        text.gsub(/\[\[(.+)\]\]/) { |match|
          name = "#{$1}".strip
          ActionController::Base.helpers.link_to("#{name}", Rails.application.routes.url_helpers.article_path("#{name}".to_url) )
        }
      end

      #
      # Formatiert Code-Bloecke
      #
      def code(text)
        text.gsub(/\[code\](.*)\[\/code\]/m) { |match|
          content_tag :pre do
            content_tag :code, :data => {:language => "bash"} do
              "#{$1}"
            end
          end
        }
      end

    end

  end
end
