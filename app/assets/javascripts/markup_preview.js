$(document).ready(function() {
  if ($("#news-preview").length > 0) {
    $("#news-preview").click(function(event) {
      $.post("/markup_preview/preview", { content : $("#news_content").val() }).done(function(data) {
        $("#news_preview_text").html(data);
        $("#news_preview_text").dialog({ 
          title: "Vorschau für News '" + $("#news_title").val() + "'",
          width: 800,
          modal: true,
          buttons: {
            "Vorschau beenden": function() {
              $(this).dialog( "close" );
            }
          }
        });
      });
    });
  }
});
