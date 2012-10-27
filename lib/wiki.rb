module Wiki
  def self.parse(wikitext)

    heading_3 = /^=== (.+) ===$/
    heading_4 = /^==== (.+) ====$/
    ext_link = /\[(.+) (.+)\]/
    int_link = /\[\[(.+)\]\]/
    u_list_1 = /^(?!\*).*((\n\*+.*)+)\n(?!\*).*/
    u_list_2 = /^(?!\*{2,}).*((\n\*{2,}.*)+)\n(?!\*{2,}).*/
    list_item = /^\*+(.*)/
    code = /\[code\](.*)\[\/code\]/

    wikitext.gsub!(heading_3) do |match|
      "<h3>#{$1}</h3>"
    end

    wikitext.gsub!(heading_4) do |match|
      "<h3>#{4}</h4>"
    end

    wikitext.gsub!(ext_link) do |match|
      "<a href=\"#{$1}\">#{$2}</a>"
    end

    wikitext.gsub!(int_link) do |match|
      "<a href=\"#{link_to article_path{:id => $1.to_url}}\">#{$1}</a>"
    end

    wikitext.gsub!(u_list) do |match|
      "<ul>#{$1}\n</ul>"
    end

    wikitext.gsub!(u_list_2) do |match|
      "<ul>#{$1}\n</ul>"
    end

    wikitext.gsub!(list_item) do |match|
      "<li>#{$1}</li>"
    end

    wikitext.gsub!(code) do |match|
      "<div class=\"code\">#{$1}</div>"
    end

    return wikitext
  end
end
