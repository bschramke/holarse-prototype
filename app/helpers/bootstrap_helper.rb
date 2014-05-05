module BootstrapHelper
  
  #
  # zeigt ein fontawesome-icon an
  #
  def fa_icon(icon)
    content_tag :i, class: "fa fa-#{icon}" do
      yield if block_given?
    end
  end
  
end
