# encoding: utf-8
class DiscountEventsController < ApplicationController
  
  before_filter :require_edit_permissions, :except => [:index, :show]  
 
  add_breadcrumb "Rabattaktionen", :discount_events_path

  def index
    @discount_events = DiscountEvent.all.decorate
  end

  def create
    @discount_event = DiscountEvent.new(discount_event_params)
    @discount_event.user = current_user

    if @discount_event.save
      redirect_to discount_events_path
    else
      redirect_to discount_events_path(@discount_event)
    end
  end

  def new
    @discount_event = DiscountEvent.new
    render :edit
  end

  def edit
    @discount_event = DiscountEvent.find(params[:id])
    add_breadcrumb "Rabattaktion #{@discount_event.name}", discount_event_path(@discount_event)
    add_breadcrumb "Bearbeiten"
  end

  def show
    @discount_event = DiscountEvent.find(params[:id]).decorate
    add_breadcrumb "Rabattaktion #{@discount_event.name}"
  end

  def update
    @discount_event = DiscountEvent.find(params[:id])
    @discount_event.update_attributes(discount_event_params)
    @discount_event.user = current_user
    @discount_event.save
    redirect_to discount_events_path(@discount_event)
  end

  def destroy
  end
  
  private

  def require_edit_permissions
    unless is_logged_in?
      flash[:warning] = "Bitte anmelden, um Rabattaktionen erstellen oder bearbeiten zu k&ouml;nnen."
      persist_position self.controller_name, self.action_name, params[:id]
      redirect_to login_path
    end
  end

  def discount_event_params
    params.require(:discount_event).permit(:name, :description, :startdate, :enddate, :website, :sourceurl)
  end 

    
end
