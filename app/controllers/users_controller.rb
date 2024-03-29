class UsersController < ApplicationController

  before_filter :require_view_permissions, :only => [:index, :show]
  before_filter :require_edit_permissions, :only => [:edit, :update, :destroy]

  add_breadcrumb "Benutzer", :users_path

  #
  # zeigt alle benutzer
  #
  def index
    @users = User.order("created_at asc").decorate
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
    @user = User.new(register_params)
    
    if @user.save && !is_spammer?(@user)
      flash[:info] = "Benutzer #{@user.username} wurde erstellt."
      redirect_to root_path
    else
      render :action => "new"
    end
  end

  #
  # aktualisiert ein benutzerprofil
  #
  def update
    user = User.friendly.find(params[:id])

    user.avatar_from_web(params[:user][:avatarweb]) if has_web_avatar?

    if user.update_attributes(user_params)
      redirect_to user
    else
      redirect_to :back
    end
  end

  #
  # deaktiviert ein benutzerprofil
  #
  def destroy
    @user = User.friendly.find params[:id]
    @user.set(:active, false)
    
    redirect_to root, :notice => "Benutzer deaktiviert"
  end

  #
  # zeige ein benutzerprofil an
  #
  def show
    @user = User.friendly.find(params[:id]).decorate
    add_breadcrumb @user.username
  end

  #
  # ermögliche das bearbeiten eines benutzerprofils
  #
  def edit
    @user = User.friendly.find(params[:id])
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
    unless has_role(:administrator) || accesses_own_profile
      flash[:error] = "Keine ausreichenden Rechte f&uuml;r diese Seite"
      redirect_to root_path
    end
  end

  #
  # prueft, ob die aufzurufende seite, das eigene profil ist
  #
  def accesses_own_profile
    User.friendly.find(params[:id]).id == current_user.id
  end

  def is_spammer?(user)
    require 'lib/spammercheck'
    a = Holarse::Spam::Spammer.new
    a.email = user.email
    a.username = user.username

    Holarse::Spam::SpammerCheck.new.is_spammer?(a)
  end

  private

  def has_web_avatar?
    params[:user][:avatarweb].present?
  end

  def register_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:username, :email, :signature, :jabber, :icq, :twitter, :diaspora, :steam, :homepage, :city, :job, :birthday, :computer, :graphics, :distro, :minecraft_username, :password, :password_confirmation, :avatar, :collaborate, :avatar, :avatarweb)
  end

end
