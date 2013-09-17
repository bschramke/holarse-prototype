$(document).ready(function() {
  $("#liveedittabs").tabs({
    beforeActivate: function(event, ui) {
      $.post("/markup_preview/preview", { content: $("#article_content").val() }).done(function(data) {
	$("#article_preview_text").html(data);
      });
    }
  });
});
