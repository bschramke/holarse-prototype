var deMoment = moment();
deMoment.lang('de');

$(document).ready(function() {
  // Das Datum relativ setzen
  $("time.moment").each(function(index, item) { 
    $(this).html( 
      deMoment.fromNow($(this).attr("datetime"))
    ); 
  });

});
