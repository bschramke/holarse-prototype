jQuery ->
  if ( autolinkable_tag = $ ".autolinkable").length
    content_title = $("header h1").html().trim()
    content_alternative_title = $("header h2").html().trim()
    
    content = autolinkable_tag.html()
    $.get "/link_generator/index.json", (articles) ->
      linked_text = content
      
      for article in articles
        do ->
          return if (article.title is content_title or article.title is content_alternative_title)
          linked_text = linked_text.replace(new RegExp(article.title, "g"), "<a href='/articles/#{article.id}'>#{article.title}</a>")

      autolinkable_tag.html(linked_text)
