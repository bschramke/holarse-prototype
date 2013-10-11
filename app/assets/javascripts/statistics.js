holarse.update_stats =  function() {
  console.debug("trying to update stats...");
  $.get("/holarse/api/site_statistics.json", function(data) {
    log.debug("Got data: " + data);
    $.Mustache.addFromDom("statistic-tmpl");
    $("#site-statistics").mustache("statistic-tmpl", data);
  });
};

$(document).ready(function() {
  console.log("asdasdasdlasdöasldkjfhlasjhfajhfs");
  holarse.update_stats();
});
