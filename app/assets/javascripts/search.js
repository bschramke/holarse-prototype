$(document).ready(function() {
  $("#q").focus(function() {

    $(this).animate({
      "width":  "+=40"
    }, "slow");

    if (window.scrolled) {
      $(".usernav").animate({
        "right":  "+=40"
      }, "slow");
    }
  });  

  $("#q").blur(function() {

    $(this).animate({
      "width": "-=40"
    }, "slow");

    if (window.scrolled) {
      $(".usernav").animate({
        "right": "-=40"
      }, "slow");
    }
  });
});
