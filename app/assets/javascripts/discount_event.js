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
    if ($("#discount-count").length == 0) {
      return;
    }

    // daten holen und hinterlegen
    $.get("/counting/discounts", function(data) {
      var discounttext = $("#discount-count").attr("data-discount-text");
      $("#discount-count").html(discounttext + " (" + data + ")");
    });

    // das ganze nach 30000ms wiederholen
    setTimeout(function() { update_discounts() }, 30000);
  }

  if ($("#discount-count").length != 0) {
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
 
  $(".discount-event-show-details").click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    var discount_event_id = $(this).attr("data-discount-event-id");
    var elem = $("tr#discount-event-details-" + discount_event_id);
    elem.toggle("slow");
    if (elem.is(":visible")) {
      $(this).removeClass("icon-circle-arrow-down").addClass("icon-circle-arrow-up");
    } else {
      $(this).removeClass("icon-circle-arrow-up").addClass("icon-circle-arrow-down");
    }
  }); 

});
