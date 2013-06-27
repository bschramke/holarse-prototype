module TwitterBootstrapHelper

  #
  # erzeugt einen twitter bootstrap menuitem
  # mit fontawesome logo und eigenem text als block
  #
  def icon_menu_item(path, icon)
    content_tag :li do
      link_to path do
        content_tag :i, :class => "icon-#{icon.to_s} icon" do
          yield
        end
      end
    end
  end

end

