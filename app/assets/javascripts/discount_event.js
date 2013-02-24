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
});
