$(document).ready(function() {
  $("#discount_event_startdate").datepicker({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_startdate").datepicker("option", "minDate", selectedDate);
    }
  });
  $("#discount_event_enddate").datepicker({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_enddate").datepicker("option", "maxDate", selectedDate);
    }
  });

  function update_discounts() {
    if ($("#discount_count").length == 0) {
      return;
    }

    // daten holen und hinterlegen
    $.get("/counting/discounts", function(data) {
      var discounttext = $("#discount_count").attr("data-discount-text");
      $("#discount_count").html(discounttext + " (" + data + ")");
    });

    // das ganze nach 30000ms wiederholen
    setTimeout(function() { update_discounts() }, 30000);
  }

  if ($("#discount_count").length != 0) {
    update_discounts();
  }
  
  //
  // Toggle-Schalter, um die erweiterten Informationen erstmal auszublenden
  //
  $("#toggle-discount-event-form-advanced").click(function(event) {
  	event.preventDefault();
  	$("#discount-event-form-advanced").toggle();
  	return false;
  });
  
  $(".discount_event td:nth-child(2), td:nth-child(3)").click(function(event) {
  	event.preventDefault();
  	event.stopPropagation();
  	$("#discount-event-advanced-" + $(this).parent().attr("data-discount-event-id")).toggle('slow');
  });

});
