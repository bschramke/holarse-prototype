class SessionsController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    # benutzer-account erstmal finden
    user = User.find_by_username(params[:username])

    begin
      UserValidator.new(user).is_valid?
    rescue => e
      flash[:error] = e.message
      redirect_to root_path and return
    end

    # wenn der benutzer noch ein altes passwort hat,
    # dann die migration aufrufen
    um = UserMigrator.new(user, params[:password])
    if um.has_legacy_password? && um.is_authenticated_with_legacy_password?
      flash[:notice] = "Der Account wurde migriert - und eingeloggt."
      redirect_to root_path and return
    end

    # neue benutzer-authentifikation
    Rails.logger.debug("Trying to login")
    if user.authenticate(params[:password])
      # erfolgreichen login in der session speichern
      session[:user_id] = user.id
      
      # erfolgreiches login vermerken
      user.successfull_login()
      Rails.logger.debug("User: #{user.inspect}")
      user.save!

      Rails.logger.debug("Login ok")      
      # zurück zur hauptseite
      flash[:notice] = "Der Login war erfolgreich."
      redirect_to root_path and return
    else
      user.increment_failed_logins()
      user.save!
      flash[:error] = "Login fehlgeschlagen"
      redirect_to root_path and return
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Erfolgreich abgemeldet'  
  end
  
end

#
# Validiert einen Benutzer
#
class UserValidator

  def initialize(user)
    @user = user
  end
  
  def is_valid?
    raise StandardError, "Benutzer konnte nicht gefunden werden" if !@user.present?
    raise StandardError, "Benutzer ist nicht aktiv" if !@user.active
    raise StandardError, "Zuviele fehlgeschlagene Login-Versuche" if @user.failed_logins > 3
  end
  
end

class UserMigrator
  def initialize(user, password)
    @user = user
    @password = password
  end

  def has_legacy_password?
    @user.old_password_hash
  end

  def is_authenticated_with_legacy_password?
    @user.authenticate_legacy(@password)
  end

  def migrate
    @user.password = @password
    @user.old_password_hash = nil
    @user.save!
  end
end
