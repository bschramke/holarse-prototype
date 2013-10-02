$(document).ready(function() {

  $.Mustache.add('news-links-template', '<a href=\"{{href}}" class=\"list-group-item\">{{href}}</a>');

  var foundLinks = $(".newsbox").find("a:not([role=internal])");
  foundLinks.each(function(index, value) {
    $("#newslinks").append( $.Mustache.render('news-links-template', value ));
  });

  if (foundLinks.length === 0) {
    $("#link-container").hide();
  }

});
