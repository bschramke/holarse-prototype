$(document).ready(function() {
  var container = $("#container");
  
  container.isotope({
    itemSelector: '.item',
    masonry: {
      columnWidth: container.width() / 20
    },
    getSortData: {
      updatedAt: function ($elem) {
        return $elem.find ('.createdat').text();
      }
    },
    sortBy: 'createdat'
  });

  $("#containerfilter a").click(function(event) {
    var selector = $(this).attr("data-filter");
    container.isotope({ filter: selector });
    return false;
  });

  // update columnWidth on window resize
  $(window).smartresize(function(){
    $container.isotope({
          // update columnWidth to a percentage of container width
              masonry: { columnWidth: container.width() / 20 }
                });
  });

});
