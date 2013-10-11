$(document).ready(function() {

  $.get("/holarse/api/site_statistics.json", function(data) {
    $.Mustache.addFromDom("statistic-tmpl");
    $("#site-statistics").mustache("statistic-tmpl", data);
  });

});
