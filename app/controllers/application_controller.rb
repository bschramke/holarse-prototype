class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #
  # Ermittelt den aktuellen eingeloggten Benutzer
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    current_user.present?
  end

  def has_role(rolename)
    current_user.roles.include?(rolename.to_s)
  end
  
  helper_method :current_user, :is_logged_in?


  
end
