class UsersController < ApplicationController

  before_filter :require_view_permissions, :only => [:index, :show]
  before_filter :require_edit_permissions, :only => [:edit, :update, :destroy]

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
    @user = User.find params[:id]
  end

  private

  #
  # man darf userseiten nur sehen, wenn man 
  # 1. eingeloggt ist
  #
  def require_view_permissions
    unless is_logged_in?
      flash[:error] = "Seite nur sichtbar, wenn man eingeloggt ist."
      redirect_to root_path
    end 
  end

  #
  # man darf userseiten nur bearbeiten, wenn man
  # 1. eingeloggt ist
  # 2. man in der rolle "administrator" ist
  # 3. die anzuzeigende benutzerseite dem aktuell eingeloggtem benutzer entspricht
  #
  def require_edit_permissions
    unless is_logged_in? && (has_role(:administrator) || accesses_own_profile)
      flash[:error] = "Keine ausreichenden Rechte f&uuml;r diese Seite"
      redirect_to root_path
    end
  end

  #
  # prueft, ob die aufzurufende seite, das eigene profil ist
  #
  def accesses_own_profile
    params[:username] == current_user.username
  end

end
