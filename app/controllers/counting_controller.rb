class CountingController < ApplicationController
  
  respond_to :json

  # ermittelt die aktuellen ungelesenen nachrichten
  def messages
  end

  # ermittelt die aktuellen rabattaktionen
  def discounts
    discounts = DiscountEvent.where(:enabled => true).count
    render :text => discounts
  end
end
