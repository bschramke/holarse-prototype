$(document).ready(function() {
  var $container = $("#container");
  
  $container.isotope({
    itemSelector: '.item',
    masonry: {
      columnWidth: $container.width() / 10
    },
    getSortData: {
      updatedAt: function ($elem) {
        return $elem.find ('.createdat').text();
      }
    },
    sortBy: 'createdat'
  });

  $("#containerfilter a").click(function(event) {
    event.preventDefault();
    var selector = $(this).attr("data-filter");
    $container.isotope({ filter: selector });
  });

  // update columnWidth on window resize
  $(window).smartresize(function(){
    $container.isotope({
          // update columnWidth to a percentage of container width
              masonry: { columnWidth: $container.width() / 10 }
                });
  });

  $(".item").click(function(event) {
    event.preventDefault();
    window.location.href = $(this).attr("data-link");
  });

});
