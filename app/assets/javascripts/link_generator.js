// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  var autolinkable_tag = $(".autolinkable");
  if (autolinkable_tag.length > 0) {
    // artikelinhalt einlesen
    var content = autolinkable_tag.html();
    // artikelnamen auslesen
    $.get('/link_generator/index.json', function(data) {
      // artikelinhalt ersetzen
      var linked_text = content;
      $.each(data, function(index, value) {
        var id = value.article.id; // id aus dem json laden
        var title = value.article.title; // title aus dem json laden

        // Finde den Titel im Text und ersetze ihn durch einen Link darauf
        var replaced_link = "<a href='/articles/" + id + "'>" + title + "</a>";
        linked_text = linked_text.replace(new RegExp(title, "g"), replaced_link);
      });
      autolinkable_tag.html(linked_text);
    });
  }
});
