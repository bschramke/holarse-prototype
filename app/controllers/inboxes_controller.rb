# -*- coding: utf-8 -*-
class InboxesController < ApplicationController

  before_filter :require_edit_permissions, only: [:update, :destroy]
  add_breadcrumb "Einreichungen"

  def index
    @inboxes = Inbox.all.decorate
  end

  def show
  end

  def new
    @inbox = Inbox.new
    render :edit
  end

  def create
    @inbox = Inbox.new(inbox_params)
    @inbox.save
  end
 
  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def require_edit_permissions
    if !is_logged_in?
      flash[:info] = "Nicht möglich"
      # TODO vereinheitlichen DRY
      persist_position self.controller_name, self.action_name, params[id]
      redirect_to login_path
    end
  end
  
  def inbox_params
    params.require(:inbox).permit(:sender, :url, :info)
  end
  
end
