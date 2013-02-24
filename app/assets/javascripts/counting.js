$(document).ready(function() {
  function update_discounts() {
    // daten holen und hinterlegen
    $.get("/counting/discounts", function(data) {
      var discounttext = $("#discount_count").attr("data-discount-text");
      $("#discount_count").html(discounttext + " (" + data + ")");
    });

    // das ganze nach 30000ms wiederholen
    setTimeout(function() { update_discounts() }, 30000);
  }

  update_discounts();
});
