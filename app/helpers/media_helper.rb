module MediaHelper

  def link_to_youtube(video)
    vid_id = video.url.match(/v=([^&]*)/)[1]
    link_to image_tag("http://img.youtube.com/vi/#{vid_id}/0.jpg"), video.url, { :class => 'fancybox-media' }
  end

  def embed_youtube(video)
    vid_id = video.url.match(/v=\w{11}/).to_s[-11..-1]
    link_to image_tag("http://img.youtube.com/vi/#{vid_id}/0.jpg"),
                      "http://youtube.com/embed/#{vid_id}",
                      { :class => 'fancybox-media' }
  end

end
