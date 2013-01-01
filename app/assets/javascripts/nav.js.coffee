$ ->
  window.scrolled = false
  $(window).scroll ->
    if $(window).scrollTop() > 50
      $(".secondary, .usernav").css
        position: 'fixed'
        top: 0
      $("#smalltux").fadeIn 'fast'
      $("#smalltuxtext").fadeIn 'fast'
    else
      $(".secondary").css
        position: 'absolute'
        top: '50px'
      $(".usernav").css 
        position: 'absolute'
        top: '48px'
      $("#smalltux").fadeOut 'fast'
      $("#smalltuxtext").fadeOut 'fast'

    if $(window).scrollTop() > 19
      $(".search_field").css
        position: 'fixed'
        top: 0
      if !window.scrolled
        $(".usernav").animate
          right: '115px'
          400
        window.scrolled = true
    else
      $(".search_field").css
        position: 'absolute'
        top: '19px'
      if window.scrolled
        $(".usernav").animate
          right: '10px'
          400
        window.scrolled = false
