$ ->
  window.scrolled = false
  $(window).scroll ->
    if $(window).scrollTop() > 50
      $(".secondary").css({'position': 'fixed', 'top': 0})
      $(".user").css({'position': 'fixed', 'top': 0})
    else
      $(".secondary").css({'position': 'absolute', 'top': '50px'})
      $(".user").css({'position': 'absolute', 'top': '48px'})

    if $(window).scrollTop() > 19
      $("aside.search input.search_field").css({'position': 'fixed', 'top': 0})
      if !window.scrolled
        $(".user").animate({'right': '115px'},400)
        window.scrolled = true
    else
      $("aside.search input.search_field").css({'position': 'absolute', 'top': '19px'})
      if window.scrolled
        $(".user").animate({'right': '10px'},400)
        window.scrolled = false
