jQuery ->
  # aktualisiert die rabattaktionen-übersicht
  update_discounts = ->
    return unless $("#discount-count").length
    
    $.get "/counting/discounts", (count) ->
      $("#discount-count").html("Rabattaktionen (#{count})")

      callback = -> update_discounts()
      setTimeout callback, 30000

  update_discounts()
