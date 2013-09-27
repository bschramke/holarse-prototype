$(document).ready(function() {
  $("#liveedittabs").tabs({
    beforeActivate: function(event, ui) {
      $.post("/holarse/api/markup_preview.json", { content: $("#markup-edit-content").val() }).done(function(data) {
	$("#markuppreviewtext").html(data);
      });
    }
  });
});
