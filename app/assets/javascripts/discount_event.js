$(document).ready(function() {
  $("#discount_event_startdate").datepicker({
    dateFormat: "dd.mm.yy",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_startdate").datepicker("option", "minDate", selectedDate);
    }
  });
  $("#discount_event_enddate").datepicker({
    dateFormat: "dd.mm.yy",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_enddate").datepicker("option", "maxDate", selectedDate);
    }
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

  $.get(holarse.current_host + "/holarse/api/discount_count.json").done(function(data) {
    $.Mustache.addFromDom("discount-events-count-tmpl");
    $("#discount-events-count").mustache("discount-events-count-tmpl", data);
  });

});
