require "lib/wiki"

module ApplicationHelper

  #
  # liefert die git-commit-version
  #
  def get_app_version
    Holarse::Application.config.app_version
  end

  def build_site_title
    "HOLARSE - Spielen unter Linux"
  end
  
end

