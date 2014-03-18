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
		    channel: item.media$group.media$credit[0].$t,
		    img_url: item.media$group.media$thumbnail[1].url,
		    desc: item.media$group.media$description.$t,
		    link: item.link[0].href,
		    published: moment(item.published.$t).fromNow(),
		    published_ts: item.published.$t
		};
	      videos.push(video);
	    });
	}
 });
 return videos;
};

holarse.update_yt_videos = function(playlists) {
  // videos laden
  var all_vids = [].concat( 
      holarse.load_yt_playlist("holarse", 15), 
      holarse.load_yt_playlist("gtuxtv", 15), 
      holarse.load_yt_playlist("GZLucki", 15),
      holarse.load_yt_playlist("Meldrian1986", 15) 
  );

  // sortieren nach datum
  var sorted_vids = all_vids.sort(function(a,b) { return a.published_ts < b.published_ts; });

  // channels extrahieren
  var channels = all_vids.map(function(data) { return data.channel; }).filter(function(itm,i,a) { return i===a.indexOf(itm); }).map(function(data) { return { channel: data }; });

  // ausgabe
  $("#yt-videos").mustache("youtube-item-template", sorted_vids);
  
  // channels
  $("#navcontext").mustache("youtube-channel-template", channels);
};

$(document).ready(function() {
  if ($("#yt-videos").length > 0) {
    holarse.update_yt_videos();
  }
});
