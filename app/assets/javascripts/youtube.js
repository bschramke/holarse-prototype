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
