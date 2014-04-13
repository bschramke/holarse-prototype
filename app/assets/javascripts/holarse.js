holarse.mustaches = {} || holarse.mustaches;

holarse.mustaches.init = function() {
      $("[id$=template]").each(function(i, template) {
        $.Mustache.addFromDom(template.id);
        console.debug("loaded " + template.id + " as mustache template");
      });
};
      
