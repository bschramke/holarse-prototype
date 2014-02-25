$(document).ready(function() {

  $("#toggle-livepreview").click(function(event) { 
    $("#livepreview").toggle();

    var is_preview_visible = $("#livepreview").is(":visible");

    if (is_preview_visible) {
      $("#input").removeClass("col-md-12").addClass("col-md-6");
    } else {
      $("#input").removeClass("col-md-6").addClass("col-md-12");
    }
  });

  $("#toggle-newsview").click(function(event) {
    var newsview = $(this).data("newsview");
    var toggled = holarse.toggle_newsview_value(newsview);

    $("#news_subtitle_input").toggle();
    $("#news_news_category_input").toggle();
    $("#news_category_list_input").toggle();

    if (newsview === "long") {
      $("#markup-edit-content").css("height", "200px");
      $("#toggle-livepreview").show();
      $("#livepreview").show();
      $("#input").removeClass("col-md-12").addClass("col-md-6");
    } else {
      $("#markup-edit-content").css("height", "80px");
      $("#toggle-livepreview").hide();
      $("#livepreview").hide();
      $("#input").removeClass("col-md-6").addClass("col-md-12");
    }

    $(this).data("newsview", toggled);
  });

  holarse.toggle_newsview_value = function(newsview_value) {
    return (newsview_value === "long" ? "short" : "long");
  }

});
