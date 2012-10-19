class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

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

  def update
    
  end

  def destroy
  end

  def show
    @user = User.find_by_slug(params[:id])
  end

  def edit
  end
end
