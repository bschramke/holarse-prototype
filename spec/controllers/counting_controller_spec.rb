require 'spec_helper'

describe CountingController do

  describe "GET 'messages'" do
    it "returns http success" do
      get 'messages'
      response.should be_success
    end
  end

  describe "GET 'discounts'" do
    it "returns http success" do
      get 'discounts'
      response.should be_success
    end
  end

end
