module FontAwesomeHelper

  def fa_icon(name, &block)
    content_tag :i, class: name.to_s do
      yield if block_given?
    end
  end  

end
