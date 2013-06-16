// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  var autolinkable_tag = $(".autolinkable");

  var content_title = $("header h1").html().trim();
  var content_alternative_title = $("header h2").html().trim();

  if (autolinkable_tag.length > 0) {
    // artikelinhalt einlesen
    var content = autolinkable_tag.html();
    // artikelnamen auslesen
    $.get('/link_generator/index.json', function(data) {
      // artikelinhalt ersetzen
      var linked_text = content;
      $.each(data, function(index, value) {
        var id = value.id; // id aus dem json laden
        var title = value.title; // title aus dem json laden

        // den eigen-artikelnamen und alternativnamen pruefen und ueberspringen
        // wir brauchen uns ja nicht selbst verlinken
        if (title === content_title || title === content_alternative_title) {
          return true;
        }

        // Finde den Titel im Text und ersetze ihn durch einen Link darauf
        var replaced_link = "<a href='/articles/" + id + "'>" + title + "</a>";
        linked_text = linked_text.replace(new RegExp(title, "g"), replaced_link);
      });
      autolinkable_tag.html(linked_text);
    });
  }
});
