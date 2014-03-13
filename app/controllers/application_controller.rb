class ApplicationController < ActionController::Base
  protect_from_forgery
 
  add_breadcrumb "Home", :root_path
  helper_method :current_user, :is_logged_in?, :has_role, :can_edit_comment?, :create_anchor_name, :breadcrumbs, :get_genres, :current_logged_in_users

  #before_filter :update_user_activity

  def persist_position(controller, action, id)
    session[:former_controller] = controller
    session[:former_action] = action
    session[:former_id] = id
    Rails.logger.debug("persisted former position in session")
  end 

  def redirect_to_previous
    redirect_to root_path and return if not has_former_page?
    prev_page_data = get_previous_page_data
    
    clear_previous_page

    redirect_to prev_page_data
  end

  private

  def get_previous_page_data
    {
      :controller => session[:former_controller],
      :action => session[:former_action],
      :id => session[:former_id]
    }
  end

  def previous_page_keys
    [:former_controller, :former_action, :former_id]
  end

  def has_former_page?
    previous_page_keys.all? {|s| session.key? s}
  end

  def clear_previous_page
    previous_page_keys.each {|s| session.delete s }
  end

  def update_user_activity
    if current_user
      current_user.update_column :lastactivity, DateTime.now
      current_user.save
    end
  end

  def current_logged_in_users
    User.last_actives
  end

  def get_genres
    Rails.cache.fetch "get-genres", expires_in: 1.minute do
      Article.tag_counts_on(:genres).sort { |a,b| a.name.downcase <=> b.name.downcase }
    end
  end

  #
  # erzeugt einen anchor-link-namen
  #
  def create_anchor_name(linkable)
    "#{linkable.class.to_s.underscore}-#{linkable.id}" if linkable.present? && linkable.respond_to?('id')
  end

  #
  # Ermittelt den aktuellen eingeloggten Benutzer
  #
  def current_user
    @current_user ||= get_cached_user(session[:user_id]) if session[:user_id]
  end

  def get_cached_user(id)
    Rails.cache.fetch "user-#{id}", expires_in: 1.minute do
      User.find(id)
    end
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
