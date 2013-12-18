$(document).ready(function() {
  $("a.fancybox").attr("rel", "gallery").fancybox({
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
