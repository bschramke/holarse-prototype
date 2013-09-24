$(document).ready(function() {

  $.Mustache.add('news-links-template', '<a href=\"{{href}}" class=\"list-group-item\">{{href}}</a>');

  $(".newsbox").find("a:not([role=internal])").each(function(index, value) {
    $("#newslinks").append( $.Mustache.render('news-links-template', value ));
  });

});
