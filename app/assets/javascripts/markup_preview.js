holarse.createPreview = function(content, target) {
  $.post("/holarse/api/markup_preview.json", { content: $(content).val() }, function(data) {
    var elem = $(target);
    elem.html(data);
    autolink_fn(elem);
  }, "html");
};

$(document).ready(function() {
  $("#liveedittabs").tabs({
    beforeActivate: function(event, ui) {
      if (ui.newTab.text().trim() === "Live-Vorschau") {
	holarse.createPreview("#markup-edit-content", "#markuppreviewtext");
      }
    }
  });
});
