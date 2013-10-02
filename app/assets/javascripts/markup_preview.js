$(document).ready(function() {
  $("#liveedittabs").tabs({
    beforeActivate: function(event, ui) {
      if (ui.newTab.text().trim() === "Live-Vorschau") {
        $.post("/holarse/api/markup_preview.json", { content: $("#markup-edit-content").val() }, function(data) {
	  var elem = $("#markuppreviewtext");
  	  elem.html(data);
	  autolink_fn(elem);
    	}, "html");
      }
    }
  });
});
