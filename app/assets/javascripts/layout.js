$(document).ready(function() {
  $("#backtotop").hide();

  $(window).bind('scroll', function() {
    if ($(this).scrollTop() > 100) {
      $("#backtotop").show();
    } else {
      $("#backtotop").hide();
    }
  });

  $("#backtotop").click(function(event) {
    event.preventDefault();
    $("html, body").animate({scrollTop:0}, 'slow');
    return false;
  });
});
