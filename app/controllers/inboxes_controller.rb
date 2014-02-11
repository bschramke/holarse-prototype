# -*- coding: utf-8 -*-
class InboxesController < ApplicationController

  before_filter :require_edit_permissions, only: [:update, :destroy]
  add_breadcrumb "Einreichungen"

  def index
    @inboxes = Inbox.all.decorate
  end

  def show
    @inbox = Inbox.find(params[:id]).decorate
  end

  def new
    @inbox = Inbox.new(sender: current_user ? current_user.username : nil)
    render :edit
  end

  def create
    @inbox = Inbox.new(inbox_params)
    @inbox.save

    flash[:info] = "Vielen Dank für deine Einsendung!"
    redirect_to inboxes_path
  end
 
  def edit
  end

  def update
  end

  def destroy
    @inbox = Inbox.find(params[:id])
    @inbox.active = false
    @inbox.save

    flash[:info] = "Einreichtung #{@inbox.id} gelöscht."
    redirect_to inboxes_path
  end

  private
  
  def require_edit_permissions
    return true if has_role(:admin)

    flash[:info] = "Es sind erweiterte Rechte erforderlich, um diese Einreichung zu löschen."
    # TODO vereinheitlichen DRY
    persist_position self.controller_name, self.action_name, params[:id]
    redirect_to login_path
  end
  
  def inbox_params
    params.require(:inbox).permit(:sender, :url, :info)
  end
  
end
