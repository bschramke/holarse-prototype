$ ->
  $(window).scroll ->
    if $(window).scrollTop() > 50
      $(".secondary").css({'position': 'fixed', 'margin-top': 0})
    else
      $(".secondary").css({'position': 'absolute', 'margin-top': '50px'})
