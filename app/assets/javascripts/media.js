$(document).ready(function() {
  $("a.fancybox").attr("rel", "gallery").fancybox({
    beforeShow: function() {
      var alt = this.element.find("img").attr("alt");
      this.inner.find("img").attr("alt", alt);
      this.title = alt;
    },
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
