$(document).ready(function() {

  $("#activitylist li:gt(10)").hide(); // erstmal verstecken
  var activitylist_status_hidden = true;

  $("#toggle-activities").click(function() {
    $("#activitylist li:gt(10)").toggle();
    if (activitylist_status_hidden) { 
      activitylist_status_hidden = false;
      $("#toggle-activities").html("ausblenden");
    } else {
      activitylist_status_hidden = true;
      $("#toggle-activities").html("alle anzeigen");
    }
  });
});
