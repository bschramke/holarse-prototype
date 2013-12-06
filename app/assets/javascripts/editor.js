$(document).ready(function() {
  $("#toggle-edit").click(function(event) {
    $("#livepreview").animate({"width": [ "toggle", "swing" ]}, 500, function() {
      var visible = $("#livepreview").is(":visible");
      if (visible) { 
	$("#input").removeClass("col-md-12").addClass("col-md-6");
      } else {
	$("#input").removeClass("col-md-6").addClass("col-md-12");
      }
    });
  });
});
