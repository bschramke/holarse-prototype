module UsersHelper

  #
  # Link auf den User
  # User-Profile können nur angesehen werden, wenn der Benutzer selbst
  # eingeloggt ist.
  #
  def link_user(user)
    current_user && user ? link_to(user.username, user) : user.username unless !user
  end

  def link_history_user(revision)
    link_user User.find(revision.whodunnit)
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
 
end
