require "lib/wiki"

module ApplicationHelper

  #
  # liefert die git-commit-version
  #
  def get_app_version
    Holarse::Application.config.app_version
  end

  def current_version_link
    link_to get_app_version[0..7], version_path(get_app_version)
  end

  def build_site_title
    "HOLARSE - Spielen unter Linux"
  end
  
end

