$ ->
  return if $("#youtube-videos").length == 0
  $.getJSON "http://gdata.youtube.com/feeds/api/users/holarse/uploads?max-results=15&start-index=1&v=2&alt=json&callback=?", (data) ->
    videos_data = []
    $.each data.feed.entry, (i, item) ->
      video_data = 
        id: item.media$group.yt$videoid.$t
        name: item.title.$t
        img_url: item.media$group.media$thumbnail[1].url
        desc: item.media$group.media$description.$t
        link: item.link[0].href

      videos_data.push video_data
    $("#youtube-tmpl").tmpl(videos_data).appendTo("#youtube-videos")  
  .success ->
    $('#youtube-loadingtext').hide()

  $(".fancybox-media").fancybox({
    openEffect  : 'none'
    closeEffect : 'none'
		helpers : {
			media : {}
		}
  })
