module UsersHelper

  #
  # Links to the given city
  #
  def link_to_osm(city)
    link_to city, osm_path(:city => city), {:class => "osm"}
  end
  

end
