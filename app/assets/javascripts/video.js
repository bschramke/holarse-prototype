const PARENT_ELEMENT = "#content";
const YOUTUBE_USER = "holarse";

function showVideos(start) {
	$(PARENT_ELEMENT).text="";  
	if (!start) var start = 1;
	$.getJSON("http://gdata.youtube.com/feeds/api/users/" + YOUTUBE_USER + "/uploads?max-results=15&start-index=" + start + "&v=2&alt=json&callback=?", function(data) {
		$.each(data.feed.entry, function(i, item) {
			var id = item.media$group.yt$videoid.$t;
			var name = item.title.$t
			var img_url = item.media$group.media$thumbnail[1].url;
		        var desc = item.media$group.media$description.$t.split('--')[0].replace(/\n/g, "<br />");
			
			$(PARENT_ELEMENT).append("<div id='video'><div id='video_name'>" + name + "</div><div id='video_img'><img src='" + img_url + "' /></div><div id='video_desc'>" + desc + "</div></div>");
		});
	});
}
    
