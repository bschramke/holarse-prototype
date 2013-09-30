$(document).ready(function() {

  $("#activitylist li:gt(10)").hide(); // erstmal verstecken

  $("#toggle-activities").click(function() {
    $("#activitylist li:gt(10)").toggle();
  });
});
