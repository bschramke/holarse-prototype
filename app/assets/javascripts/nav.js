$(document).ready(function() {
  // Neue-Inhalte-Button
  $("#new_button").button({
    icons: {
      primary: "ui-icon-circle-plus",
      secondary: "ui-icon-triangle-1-s"
    }
  }).click(function(event) {
    event.preventDefault();
    event.stopPropagation();

    $("#newbtn-content").dialog({
      height: 140,
      modal: true
    });
  });
});  
                                                        
$(function() {
    window.scrolled = false;
    return $(window).scroll(function() {
      if ($(window).scrollTop() > 50) {
        $(".secondary, .usernav").css({
          position: 'fixed',
          top: 0
        });
        $("#smalltux").fadeIn('fast');
        $("#smalltuxtext").fadeIn('fast');
        $("#new_button").animate({
          position: 'fixed',
          left: '225px',
          bottom: '15px'
        });
      } else {
        $(".secondary").css({
          position: 'absolute',
          top: '50px'
        });
        $(".usernav").css({
          position: 'absolute',
          top: '48px'
        });
        $("#smalltux").fadeOut('fast');
        $("#smalltuxtext").fadeOut('fast');
      }
      if ($(window).scrollTop() > 19) {
        $(".search_field").css({
          position: 'fixed',
          top: 0
        });
        if (!window.scrolled) {
          $(".usernav").animate({
            right: '115px'
          }, 400);
          return window.scrolled = true;
        }
      } else {
        $(".search_field").css({
          position: 'absolute',
          top: '19px'
        });
        if (window.scrolled) {
          $(".usernav").animate({
            right: '10px'
          }, 400);
          return window.scrolled = false;
        }
      }
    });
  });
