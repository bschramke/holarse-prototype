load_yt_playlist = (channelname, maxresults) ->
  videos = []
  $.ajax
    url: "//gdata.youtube.com/feeds/api/users/#{channelname}/uploads?max-results=#{maxresults}&start-index=1&v=2&alt=json"
    async: false
    dataType: 'json'
    success: (data) -> 
      $.each data.feed.entry, (i, item) ->
        published = new Date(item.published.$t)
        video =  
          id: item.media$group.yt$videoid.$t
          author: item.author[0].name.$t
          name: item.title.$t
          img_url: item.media$group.media$thumbnail[1].url
          desc: item.media$group.media$description.$t
          link: item.link[0].href
          published: published.toUTCString()
          publishedLocaleString: published.toLocaleString()
        videos.push video
  videos

if ( template = $ "#youtube-tmpl" ).length
  videos = [].concat( load_yt_playlist("holarse", 15), load_yt_playlist("gtuxtv", 15) )
  sorted_videos = videos.sort( (a, b) -> new Date(a.published) - new Date(b.published) )
  $("#youtube-tmpl").tmpl(sorted_videos).appendTo("#yt-videos")
