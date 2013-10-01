$(document).ready(function() {

  $("#activitylist li:gt(2)").hide(); // erstmal verstecken
  var activitylist_status_hidden = true;

  $("#toggle-activities").click(function() {
    $("#activitylist li:gt(2)").toggle();
    if (activitylist_status_hidden) { 
      activitylist_status_hidden = false;
      $("#toggle-activities").html("ausblenden");
    } else {
      activitylist_status_hidden = true;
      $("#toggle-activities").html("alle anzeigen");
    }
  });
});
