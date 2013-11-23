holarse.autolink_fn = function(elem) {
  var autolinkable_tag = elem;
  var content = autolinkable_tag.html();

  var ignorables = [];
  if (autolinkable_tag.data("ignores") !== undefined) {
    ignorables = $.map(autolinkable_tag.data("ignores").split(","), String.toUpperCase);
  }

  $.get(holarse.current_host + "/holarse/api/autolinkable.json", function(articles) {
    var linked_text = content;
    for (var i=0; i < articles.length; i++) {
      if ($.inArray(articles[i].title.toUpperCase(), ignorables) >= 0) { continue; }
      var regexp = new RegExp("( " + articles[i].title + "\S*)", "gi");
      linked_text = linked_text.replace(regexp, "<a href='/articles/" + articles[i].id + "' role='internal'>$1</a>");
    }
    autolinkable_tag.html(linked_text);
  });
};

$(document).ready(function() {
  
  $(".autolinkable").each(function(index) {
    holarse.autolink_fn($(this));
  });

});
