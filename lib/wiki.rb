module Holarse
  class Wiki

    @mapping_table = {
      /^=== (.+) ===$/    => "<h3>#{$1}</h3>",                                                   # heading 3
      /^==== (.+) ====$/  => "<h4>#{$1}</h3>",                                                   # heading 4
      /\[(.+) (.+)\]/     => "<a href=\"#{$1}\">#{$2}</a>",                                      # externer link
      /\[\[(.+)\]\]/      => "<a href=\"#{link_to article_path{:id => $1.to_url}}\">#{$1}</a>",  # interner link
      /^(?!\*).*((\n\*+.*)+)\n(?!\*).*/ =>  "<ul>#{$1}\n</ul>", # liste
      /^(?!\*{2,}).*((\n\*{2,}.*)+)\n(?!\*{2,}).*/ =>  "<ul>#{$1}\n</ul>",  # liste 2
      /^\*+(.*)/  => "<li>#{$1}</li>", # listelement
      /\[code\](.*)\[\/code\]/ => "<div class=\"code\">#{$1}</div>" # code
    }

    def initialize(wikitext)
      @wikitext = wikitext
    end

    def to_html
      @wikitext.gsub(Regexp.union(@mapping_table.keys))
    end

  end
end
