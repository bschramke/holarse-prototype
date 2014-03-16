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
});
