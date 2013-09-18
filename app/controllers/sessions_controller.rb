class SessionsController < ApplicationController

  before_filter :save_return, :only => [:new, :destroy]  

  def index
  end
  
  def new
  end
  
  def create
    # benutzer-account erstmal finden
    user = User.find_by_username(params[:session][:username])

    if !user.present? || !user.login_allowed()
      flash[:warning] = "Der Login ist nicht m&ouml;glich."
      return_back_or_default and return
    end

    if user.do_authenticate(params[:session][:password])
      session[:user_id] = user.id
      user.register_successfull_login()    
      flash[:info] = "Login war erfolgreich"
    else
      flash[:warning] = "Der Login ist leider fehlgeschlagen"
      user.increment_failed_logins()
    end
    user.save!

    return_back_or_default
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    session[:user_id] = nil
    return_back_or_default
  end

  private

  def save_return
    store_return_to
  end
  
end
