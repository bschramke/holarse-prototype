module MediaHelper

  def link_to_youtube(video)
    vid_id = video.url.match(/v=([^&]*)/)[1]
    link_to image_tag("http://img.youtube.com/vi/#{vid_id}/0.jpg"), video.url, { :class => 'fancybox-media' }
  end

end
