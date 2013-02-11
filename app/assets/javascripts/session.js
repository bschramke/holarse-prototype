$(document).ready(function() {
  // Definition des Login-Formulars
  $("#loginform").dialog({
    "title":  "An Holarse anmelden",
    "width":  450,
    "height": 350,
    "modal":  true,
    "autoOpen":  false
  });

  // Event
  $("#loginform-link").click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    $("#loginform").dialog('open');
  });
});
