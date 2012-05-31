@notify_notice = (msg) ->
  if msg isnt ""
    noty
      text: msg
      layout: "topCenter"
      theme: "noty_theme_default"
      type: "success"
      easing: "swing"
      animateOpen:
        height: "toggle"
      animateClose:
        height: "toggle"
      speed: "500"
      timeout: "5000"
      closeable: "true"
      closeOnSelfClick: "true"
      cssPrefix: 'noty_'
      closeButton : true

@notify_warning = (msg) ->
  if msg isnt ""
    noty
      text: msg
      layout: "topCenter"
      theme: "noty_theme_default"
      type: "alert"
      easing: "swing"
      animateOpen:
        height: "toggle"
      animateClose:
        height: "toggle"
      speed: "500"
      timeout: "5000"
      closeable: "true"
      closeOnSelfClick: "true"
      cssPrefix: 'noty_'
      closeButton : true            

@notify_error = (msg) ->
  if msg isnt ""
    noty
      text: msg
      layout: "topCenter"
      theme: "noty_theme_default"
      type: "error"
      easing: "swing"
      animateOpen:
        height: "toggle"
      animateClose:
        height: "toggle"
      speed: "500"
      timeout: "5000"
      closeable: "true"
      closeOnSelfClick: "true"
      cssPrefix: 'noty_'
      closeButton : true            

@notify_loading = (msg) ->
  if msg isnt ""
    noty
      text: msg
      layout: "bottom"
      type: "success"
      textAlign: "center"
      easing: "swing"
      animateOpen:
        height: "toggle"
      animateClose:
        height: "toggle"
      speed: "500"
      timeout: "1000"
      closeable: "false"
      closeOnSelfClick: "false"

jQuery ->
  $(".flash .notice").each ->
    msg = $(this).html().trim()
    notify_notice(msg)

  $(".flash .warning").each ->
    msg = $(this).html().trim()
    notify_warning(msg)
  
  
  $(".flash .error").each ->
    msg = $(this).html().trim()
    notify_error(msg)
