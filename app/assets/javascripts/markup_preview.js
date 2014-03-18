holarse.createPreview = function(content, target, autolink) {
  $.post(holarse.current_host + "/holarse/api/markup_preview.json", { content: $(content).val() || $(content).html() }, function(data) {
    var elem = $(target);
    elem.html(data);
  }, "html");
};

$(document).ready(function() {
  if ($("#markup-edit-content").length > 0) {
    // wenn die vorschau eh nicht angezeigt wird, auch nicht aktualisieren
    if ($("#livepreview").is(":hidden")) { return; }

    // Initiales Preview
    holarse.createPreview("#markup-edit-content", "#markuppreviewtext");
 
    // Preview aktualisieren
    $("#markup-edit-content").keyup(function() {
      holarse.createPreview("#markup-edit-content", "#markuppreviewtext");
    });
  }
});
