module UsersHelper

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
