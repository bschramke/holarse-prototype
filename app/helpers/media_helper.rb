module MediaHelper

  def time_field(date=nil)
    content_tag :time, :datetime => date, class: "moment" do
      date unless date.nil?
    end
  end

  def link_to_youtube(video)
    vid_id = video.url.match(/v=([^&]*)/)[1]
    link_to image_tag("http://img.youtube.com/vi/#{vid_id}/sddefault.jpg"), video.url, { :class => 'fancybox-media img-responsive' }
  end

  def embed_youtube(url)
    link_to youtube_poster(url),
                      "http://youtube.com/embed/#{get_youtube_id(url)}",
                      { :class => 'fancybox-media img-responsive' }
  end

  def youtube_poster(url)
    image_tag "http://img.youtube.com/vi/#{get_youtube_id(url)}/hqdefault.jpg"
  end

  def is_youtube?(text)
    text.count(" ") == 0 and text.start_with?("http") and text.include?("youtu")
  end

  private

  def get_youtube_id(url)
    url.match(/v=\w{11}/).to_s[-11..-1]
  end

end
