$ ->
  $(window).scroll ->
    if $(window).scrollTop() > 50
      $(".secondary").css({'position': 'fixed', 'top': 0})
      $(".user").css({'position': 'fixed', 'top': 0})
    else
      $(".secondary").css({'position': 'absolute', 'top': '50px'})
      $(".user").css({'position': 'absolute', 'top': '48px'})
