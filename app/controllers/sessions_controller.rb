class SessionsController < ApplicationController

  def index
  end
  
  def new
    add_breadcrumb "Anmelden"
  end
  
  def create
    # benutzer-account erstmal finden
    user = User.find_by_username(params[:session][:username])

    if !user.present? || !user.login_allowed()
      flash[:warning] = "Der Login ist nicht m&ouml;glich."
      redirect_to :root and return
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

    redirect_to :root
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
