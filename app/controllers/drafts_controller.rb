#encoding: utf-8
class DraftsController < ApplicationController

  add_breadcrumb "Mein Profil"
  add_breadcrumb "Meine Entwürfe"

  def index
    @drafts = Draft.all.for_user(current_user).decorate
    add_breadcrumb "Übersicht"
  end

  def new
  end

  def create
  end

  def show
    @draft = Draft.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
