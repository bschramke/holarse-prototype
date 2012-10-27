$ ->
  $("nav.context").toggle ->
    $(this).animate
      "height": "300px"
  , ->
    $(this).animate
      "height": "25px"

