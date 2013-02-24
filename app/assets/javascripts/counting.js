$(document).ready(function() {
  function update_discounts() {
    // daten holen und hinterlegen
    $.get("/counting/discounts", function(data) {
      $("#discount_count").attr("data-discount-count", data);
    });
    
    // daten in die oberfläche setzen
    var discountcount = $("#discount_count").attr("data-discount-count");
    var discounttext = $("#discount_count").attr("data-discount-text");
    $("#discount_count").html(discounttext + " (" + discountcount + ")");
    
    setTimeout(function() { update_discounts() }, 30000);
  }

  update_discounts();
});
