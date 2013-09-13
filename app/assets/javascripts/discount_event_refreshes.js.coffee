jQuery ->
  # aktualisiert pro seite einmal die übersicht
  $.get "/counting/discounts", (count) ->
    $("#discount-count").html("Rabattaktionen (#{count})")
