jQuery ->
  if ( autolinkable_tag = $ ".autolinkable").length
    content_title = $("#title").data("title").trim()
    content_alternative_title = $("#alttitle").data("title").trim()
    
    content = autolinkable_tag.html()
    $.get "/link_generator/index.json", (articles) ->
      linked_text = content
      
      for article in articles
        do ->
          return if (article.title.toUpperCase() is content_title.toUpperCase() or article.title.toUpperCase() is content_alternative_title.toUpperCase())
          linked_text = linked_text.replace new RegExp("(#{article.title})", "gi"), "<a href='/articles/#{article.id}'>$1</a>"

      autolinkable_tag.html(linked_text)
