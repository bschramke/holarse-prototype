module UsersHelper

  #
  # Link auf den User
  # User-Profile können nur angesehen werden, wenn der Benutzer selbst
  # eingeloggt ist.
  #
  def link_user(user)
    current_user && user ? link_to(user.username, user) : user.username unless !user
  end

  #
  # Links to the given city
  #
  def link_to_osm(city)
    if city.present?
      link_to city, osm_path(:city => city), {:class => "osm"}
    else
      city
    end
  end
 
  # 
  # zeigt den freischaltungsstatus
  # eines minecraft-benutzers
  # grafisch an.
  #
  def display_mc_whitelist_status(status)
    status.present? && status ? image_tag("gtk-apply.svg", :alt => t('.whitelisted'), :class => "mc_whitelist_status") : image_tag("gtk-dialog-error.svg", :alt => t('.not_whitelisted'), :class => "mc_whitelist_status")
  end

end
