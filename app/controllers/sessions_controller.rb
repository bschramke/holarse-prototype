class SessionsController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    # benutzer-account erstmal finden
    user = User.where(:username => params[:username]).first        

    # benutzer wurde nicht gefunden
    if user == nil
      Rails.logger.debug("User #{params[:username]} not found")
      flash[:error] = "Benutzer konnte nicht gefunden werden"
      return
    end

    # benutzer nicht aktiv    
    if !user.active
      Rails.logger.debug("User #{params[:username]} not active")
      flash[:error] = "Benutzer ist deaktiviert."
      return
    end
    
    # zu viele fehlversuche
    if user.failed_logins > 3
     Rails.logger.debug("User #{params[:username]} has too many failed logins")        
     flash[:error] = "Benutzer hat bereits zuviele Fehlversuche"
     return
    end

    # wenn der benutzer noch ein altes passwort hat,
    # dann die migration aufrufen
    Rails.logger.debug("Checking for legacy password")
    if user && user.active && user.old_password_hash
      Rails.logger.debug("Legacy password found")
      # den benutzer migrieren
      do_migrate_user(user, params)
    end
    Rails.logger.debug("No Legacy password found")    

    # neue benutzer-authentifikation
    Rails.logger.debug("Trying to login")
    if user.authenticate(params[:password])
      # erfolgreichen login in der session speichern
      session[:user_id] = user.id
      
      # erfolgreiches login vermerken
      user.last_login = Time.now
      user.failed_logins = 0      
      user.save

      Rails.logger.debug("Login ok")      
      # zurück zur hauptseite
      flash[:notice] = "Der Login war erfolgreich."
      return
    end
    
    Rails.logger.debug("Login failed")
    
    # fehlgeschlagene versuche hochzählen
    user.inc(:failed_logins, 1)
    user.save   
     
    # zurück zur hauptseite
    flash[:error] = "Login fehlgeschlagen."
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
  
  private
  
  #
  # migriere den benutzer auf das neue passwortsystem
  #
  def do_migrate_user(user, params)
    Rails.logger.debug("Migrating #{user.username}")
    # wenn es ein altes passwort gibt, dann verwende dieses, bis ein neues
    # eingegeben wird.
    if user && user.active && user.old_password_hash && user.authenticate_legacy(params[:password])

      # wandle das alte passwort in das neue um
      user.migrate_password(params[:password])
      
      user.save
      
      # das alte passwort löschen
      user.unset(:old_password_hash)
    end  
  end  

end
