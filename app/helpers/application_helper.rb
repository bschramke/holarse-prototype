require "lib/wiki"

module ApplicationHelper

  #
  # liefert die git-commit-version
  #
  def get_app_version
    Holarse::Application.config.app_version
  end

  def get_short_version
    get_app_version[0..7]
  end

  def current_version_link
    link_to version_path(get_app_version) do
      fa_icon "github"
      get_short_version
    end
  end

  def build_site_title
    "HOLARSE - Spielen unter Linux"
  end

end

