class UsersController < ApplicationController

  #
  # zeigt alle benutzer
  #
  def index
    @users = User.all
  end

  #
  # ermöglicht das registrieren eines neuen benutzers
  #
  def new
    @user = User.new
  end

  #
  # versucht einen neuregistrierten benutzer zu speichern
  #
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html  { redirect_to(@user, :notice => 'Benutzer wurde erstellt.') }
      else
        format.html  { render :action => "new" }
      end
    end    
  end

  #
  # aktualisiert ein benutzerprofil
  #
  def update
    
  end

  #
  # deaktiviert ein benutzerprofil
  #
  def destroy
    @user = User.find params[:id]
    @user.set(:active, false)
    
    redirect_to root, :notice => "Benutzer deaktiviert"
  end

  #
  # zeige ein benutzerprofil an
  #
  def show
    @user = User.find params[:id]
  end

  #
  # ermögliche das bearbeiten eines benutzerprofils
  #
  def edit
  end
end
