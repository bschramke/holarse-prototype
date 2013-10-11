holarse.update_stats =  function() {
  $.get(holarse.current_host + "/holarse/api/site_statistics.json").done(function(data) {
    $.Mustache.addFromDom("statistic-tmpl");
    $("#site-statistics").mustache("statistic-tmpl", data);
  }, "json");
};

$(document).ready(function() {
  holarse.update_stats();
});
