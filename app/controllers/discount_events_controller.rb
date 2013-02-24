class DiscountEventsController < ApplicationController
  def index
    @discount_events = DiscountEvent.order("startdate desc")
  end

  def create
    @discount_event = DiscountEvent.new(params[:discount_event])
    @discount_event.user = current_user

    if @discount_event.save
      redirect_to discount_events_path
    else
      redirect_to :back
    end
  end

  def new
    @discount_event = DiscountEvent.new
  end

  def edit
    @discount_event = DiscountEvent.find(params[:id])
  end

  def show
    @discount_event = DiscountEvent.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
