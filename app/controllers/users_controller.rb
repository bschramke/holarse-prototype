class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
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
