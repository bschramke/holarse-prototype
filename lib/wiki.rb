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

      def external_links(text)
        text.gsub(/\[(.*) (.*)\]/) { |match|
          ActionController::Base.helpers.link_to("#{$2}", "#{$1}")
        }
     end

      def article_links(text)
        text.gsub(/\[\[(.+)\]\]/) { |match|
          ActionController::Base.helpers.link_to("#{$1}", Rails.application.routes.url_helpers.articles_path("#{$1}".to_url) )
        }
      end

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
