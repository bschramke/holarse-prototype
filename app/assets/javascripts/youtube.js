holarse.load_yt_playlist = function(channelname, maxresults) {
  var videos = [];
  $.ajax({
      url: "http://gdata.youtube.com/feeds/api/users/" + channelname + "/uploads?max-results=" + maxresults + "&start-index=1&v=2&alt=json",
      async: false,
	dataType: 'json',
	success: function(data) {
	    $.each(data.feed.entry, function(i, item) {
		var video = {
		    id: item.media$group.yt$videoid.$t,
		    author: item.author[0].name.$t,
		    name: item.title.$t,
		    img_url: item.media$group.media$thumbnail[1].url,
		    desc: item.media$group.media$description.$t,
		    link: item.link[0].href,
		    updated: item.updated.$t
		};
	      videos.push(video);
	    });
	}
 });
 return videos;
};

holarse.update_yt_videos = function(playlists) {
  // videos laden
  var all_vids = [].concat( holarse.load_yt_playlist("holarse", 15), holarse.load_yt_playlist("gtuxtv", 15) );

  // sortieren nach datum
  var sorted_vids = all_vids.sort(function(a,b) { return a.updated < b.updated; });

  // ausgabe
  $.Mustache.addFromDom('youtube-tmpl');
  $("#yt-videos").mustache("youtube-tmpl", sorted_vids);
  $(".autolinkable").each(function(index) { autolink_fn($(this)); });
};

$(document).ready(function() {
  if ($("#yt-videos").length > 0) {
    holarse.update_yt_videos();
  }
});
