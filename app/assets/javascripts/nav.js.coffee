$ ->
  window.scrolled = false
  $(window).scroll ->
    if $(window).scrollTop() > 50
      $(".secondary, .user").css
        position: 'fixed'
        top: 0
      $(".context").css
        position: 'fixed'
        top: '16px'
      $("#smalltux").fadeIn 'fast'
    else
      $(".secondary").css
        position: 'absolute'
        top: '50px'
      $(".user").css 
        position: 'absolute'
        top: '48px'
      $(".context").css
        position: 'absolute'
        top: '66px'
      $("#smalltux").fadeOut 'fast'

    if $(window).scrollTop() > 19
      $(".search_field").css
        position: 'fixed'
        top: 0
      if !window.scrolled
        $(".user").animate
          right: '115px'
          400
        window.scrolled = true
    else
      $(".search_field").css
        position: 'absolute'
        top: '19px'
      if window.scrolled
        $(".user").animate
          right: '10px'
          400
        window.scrolled = false
