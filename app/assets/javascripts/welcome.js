$(document).ready(function() {

  $("#activitylist li:gt(2)").hide(); // erstmal verstecken
  var activitylist_status_hidden = true;
  $("#activity-list-icon").addClass("fa-plus");

  $("#toggle-activities").click(function() {
    $("#activitylist li:gt(2)").toggle();
    if (activitylist_status_hidden) { 
      activitylist_status_hidden = false;
      $("#toggle-activities").html("ausblenden");
      $("#activity-list-icon").removeClass("fa-plus").addClass("fa-minus");
    } else {
      activitylist_status_hidden = true;
      $("#toggle-activities").html("alle anzeigen");
      $("#activity-list-icon").removeClass("fa-minus").addClass("fa-plus");
    }
  });
});
