class SessionsController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
    user = User.where(:username => params[:username]).first        
    Rails.logger.debug("User=#{user.inspect}")
    if user && user.active && user.authenticate(params[:password])
      session[:user_id] = user.id
      Rails.logger.debug("Using new password")
      redirect_to root_url, :notice => t('session.login_ok') and return
    end
    
    # wenn es ein altes passwort gibt, dann verwende dieses, bis ein neues
    # eingegeben wird.
    if user && user.active && user.old_password_hash && user.authenticate_legacy(params[:password])
      session[:user_id] = user.id

      # wandle das alte passwort in das neue um
      user.migrate_password(params[:password])
      Rails.logger.debug("Using old password")
      redirect_to root_url, :notice => t('session.login_ok') and return
    end

    Rails.logger.debug("Login failed")
    redirect_to root_url, :flash => {:error => t('session.login_failed') } and return
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t('session.logout_ok')    
  end

end
