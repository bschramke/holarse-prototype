$(document).ready(function() {
  //
  // Datumsauswahl Anfangsdatum
  //
  $("#discount_event_startdate").datepicker({
    dateFormat: "dd.mm.yy",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_startdate").datepicker("option", "minDate", selectedDate);
    }
  });

  //
  // Datumsauswahl Enddatum
  //
  $("#discount_event_enddate").datepicker({
    dateFormat: "dd.mm.yy",
    changeMonth: true,
    numberOfMonths: 2,
    firstDay: 1,
    onClose: function(selectedDate) {
      $("#discount_event_enddate").datepicker("option", "maxDate", selectedDate);
    }
  });

  //
  // Live-Anzeige der Anzahl der Rabattaktionen
  //
  if ($("#discount-events-count-tmpl").length > 0) {
    $.get(holarse.current_host + "/holarse/api/discount_count.json").done(function(data) {
      $.Mustache.addFromDom("discount-events-count-tmpl");
      $("#discount-events-count").mustache("discount-events-count-tmpl", data);
    }); 
  }

});
