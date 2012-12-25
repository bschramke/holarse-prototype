(function() {
  $(document).ready(function() {
    $("#users").isotope({
      itemSelect: ".user",
      masonry: {
          columnWidth: 150
      },

      getSortData : {
        name : function ( $elem ) {
          return $elem.text();
        }
      },

      sortBy: 'name',
    });

    $('#sort-by a').click(function() {
      console.log('clicked');
      if ( $(this).attr('href') === '#ascending' ) {
        $("#users").isotope({
          sortAscending: true
        });
      }
      else {
        $('#users').isotope({
          sortAscending: false
        });
      }
      return false;
    });
  });

}).call(this);

