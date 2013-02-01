class ApplicationController < ActionController::Base
  protect_from_forgery
 
  helper_method :current_user, :is_logged_in?, :has_role, :can_edit_comment?

  private

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

  # definiert, wann jemand einen kommentar bearbeiten darf.
  # momentan duerfen nur admins, moderatoren oder der eigene
  # autor des kommentars diesen bearbeiten
  def can_edit_comment?(comment)
    comment.present? && (has_role :admin, :moderator || comment.user == current_user || young_enough_to_edit?(comment.created_at))
  end
  
  # ermittelt, ob ein objekt noch bearbeitet werden kann bis
  # die archivierungszeit abgelaufen ist
  def young_enough_to_edit?(date, max_days=7)
    date + max_days.days > Date.today
  end
                                                            


end
