function load_yt_playlist(channelname, maxresults) {
  var videos = [];
  $.ajax({
    url: "//gdata.youtube.com/feeds/api/users/" + channelname + "/uploads?max-results=" + maxresults + "&start-index=1&v=2&alt=json",
    async: false,
    dataType: 'json',
    success: function(data) {
      $.each(data.feed.entry, function(i, item) {
      	var published = new Date(item.published.$t);
        var video = {
          id: item.media$group.yt$videoid.$t,
          author: item.author[0].name.$t,
          name: item.title.$t,
          img_url: item.media$group.media$thumbnail[1].url,
          desc: item.media$group.media$description.$t,
          link: item.link[0].href,
          published: published.toUTCString(),
          publishedLocaleString: published.toLocaleString()
        };
        videos.push(video);
      });
    }
  });
  return videos;
}

$(document).ready(function() {

  if ($("#youtube-tmpl").length != 0) {
    // Videos laden
    var all_vids = [].concat( 
                              load_yt_playlist("holarse", 15), 
                              load_yt_playlist("gtuxtv", 15) 
                            );

    // sortieren nach Datum
    var sorted_vids = all_vids.sort(function(a,b) {
      return b.published - a.published;
    });


    // Ausgabe
    $("#youtube-tmpl").tmpl(sorted_vids).appendTo("#yt-videos");
  };   

});
