load_yt_playlist = (username) ->
  $.getJSON "http://gdata.youtube.com/feeds/api/users/" + username + "/uploads?max-results=15&start-index=1&v=2&alt=json&callback=?", (data) ->
    videos_data = []
    $.each data.feed.entry, (i, item) ->
      video_data = 
        id: item.media$group.yt$videoid.$t
        author: item.author[0].name.$t
        name: item.title.$t
        img_url: item.media$group.media$thumbnail[1].url
        desc: item.media$group.media$description.$t
        link: item.link[0].href
        updated: item.updated.$t 

      videos_data.push(video_data)
    return videos_data


$ ->
  # alle videos laden und vermischen
  all_videos = [].concat( load_yt_playlist("holarse"), load_yt_playlist("gtuxtv") )

  console.debug("loaded " + all_videos.length + " elements") 
 
  # videos sortieren nach aktualisierungsdatum
  sorted_videos = all_videos.sort (a,b) ->
                    a.updated > b.updated
  
  # einfügen
  $("#youtube-tmpl").tmpl(sorted_videos).appendTo("#yt-videos")


