module ApplicationHelper

  def get_app_version
    Holarse::Application.config.app_version
  end

end
