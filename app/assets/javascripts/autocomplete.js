$(document).ready(function() {

  // Tag-Vervollständigung
  $(".tagsinput").each(function(e) {
    $(this).tagsInput({
      "autocomplete_url": "/holarse/api/taglist?context=" + $(this).data("context"),
      "defaultText": "Einen Tag eintragen"
    });
  });

  // Such-Vervollständigung
  $("#search_q").autocomplete({
    "autoFocus": "false",
    "minLength": 2,
    "source": "/search/suggest.json",
    "select": function(event, ui) {
      $("#search_q").val(ui.item.title);
      window.location = ui.item.url;
      return false;
    }}).data("uiAutocomplete")._renderItem = function(ul, item) {
      return $("<li></li>")
	.data("item.autocomplete", item)
        .append("<a><i class=\"" + item.icon + "\" /> <b>" + item.title + "</b><br /><i>" + item.secondary_title + "</i></a>")
        .appendTo(ul);
      };
});
