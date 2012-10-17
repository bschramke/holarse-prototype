$ ->
  $("#q").focus ->
    $(this).animate
      width: "+=40"
    ,"slow"

  $("#q").blur ->
    $(this).animate
      "width": "-=40"
    ,"slow"
