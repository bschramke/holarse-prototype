$(document).ready(function() {
  if ($("#gol-sales").length > 0) {
    $.get("http://www.gamingonlinux.com/sale_rss.php", function(data) {
      $(data).find("entry").each(function () { // or "item" or whatever suits your feed
	var el = $(this);
        console.log("------------------------");
        console.log("title      : " + el.find("title").text());
        console.log("author     : " + el.find("author").text());
        console.log("description: " + el.find("description").text());
      });
    });
  }
});
