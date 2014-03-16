$(document).ready(function() {
  $("a.fancybox").fancybox({
    openEffect: 'none',
    closeEffect: 'none'
  });

  $(".fancybox-media").fancybox({
    openEffect: 'none',
    closeEffect: 'none',
    helpers: {
      media: {}
    }
  });


  $(".bxslider").bxSlider({
    video: true,
    useCSS: false,
    captions: true,
    adaptiveHeight: true,
    auto: true,
    autoControls: false,
    autoHover: true
  });

});
