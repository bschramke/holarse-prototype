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

  def has_role(*rolenames)
    return false unless is_logged_in?   
    current_user.roles.any? { |x| rolenames.map{|r| r.to_s }.include?(x.name) }
  end
 
  helper_method :current_user, :is_logged_in?

end
