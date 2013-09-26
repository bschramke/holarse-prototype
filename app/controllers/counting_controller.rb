class CountingController < ApplicationController
  
  respond_to :json

  # ermittelt die aktuellen rabattaktionen
  def discounts
    discounts = Rails.cache.fetch "discount-events-count", expires_in: 10.minutes do
      DiscountEvent.all.count
    end
    render :text => discounts
  end

  protected

  def update_user_activity
    # soll nicht als aktivitaet zaehlen
  end

end
