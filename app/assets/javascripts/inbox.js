$(document).ready(function() {

  // Inbox-Counter setzen
  $.get("holarse/api/inbox_count.json", function(data) {
    $("#inbox-count").empty().append(data.count);
  });

  $("#inbox_url").focusout(function() {
    // url auslesen
    var url = $.trim( $(this).val() );
    if (url === "") { return; }

    // wartetext setzen
    var inbox_info = $("#inbox_info");
    inbox_info.attr("readonly", "readonly");
    inbox_info.val("Lese Daten von der Webseite...");

    // url-titel abfragen
    $.post("holarse/api/grab_title.json", 
	   { url: $(this).val()},
	   function(data) {
	     console.log(data);
	     console.log(data.title);
	     $("#inbox_info").val(data.title + "\n");
	     $("#inbox_info").removeAttr("readonly");
	   });
  });

});
