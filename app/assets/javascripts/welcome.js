$(document).ready(function() {
  var container = $("#container");
  
  container.isotope({
    itemSelector: '.item',
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

});
