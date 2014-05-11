  // Datumsauswahl
  $("#startdate, #enddate").datepicker({language: "de"});
  
  //
  // Live-Anzeige der Anzahl der Rabattaktionen
  //
  //
  $.get("holarse/api/discount_count.json", function(data) {
    $("#discount-event-count").empty().append(data.count);
  }, "json");