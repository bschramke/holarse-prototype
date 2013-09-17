$(document).ready(function() {
  $("a.collapser[data-collapse=article-description]").click(function(event) {
    $("#article-description").collapse('toggle');
  });
});
