module Holarse
  module Wiki
    class Parser
      include Rails.application.routes.url_helpers

      @@mapping_table = {
        /^=== (.+) ===$/    => "<h3>#{$1}</h3>",                                                   # heading 3
        /^==== (.+) ====$/  => "<h4>#{$1}</h3>",                                                   # heading 4
        /\[(.+) (.+)\]/     => "<a href=\"#{$1}\">#{$2}</a>",                                      # externer link
        /\[\[(.+)\]\]/      => ActionController::Base.helpers.link_to("#{$1}", Rails.application.routes.url_helpers.articles_path("#{$1}".to_url)),
        /^(?!\*).*((\n\*+.*)+)\n(?!\*).*/ =>  "<ul>#{$1}\n</ul>", # liste
        /^(?!\*{2,}).*((\n\*{2,}.*)+)\n(?!\*{2,}).*/ =>  "<ul>#{$1}\n</ul>",  # liste 2
        /^\*+(.*)/  => "<li>#{$1}</li>", # listelement
        /\[code\](.*)\[\/code\]/ => "<div class=\"code\">#{$1}</div>" # code
      } 

      def initialize(wikitext)
        @wikitext = wikitext
        puts "#{@@mapping_table.inspect}"
      end

      def to_html
        @wikitext.gsub(Regexp.union(@@mapping_table.keys), @@mapping_table)
      end

    end
  end
end
