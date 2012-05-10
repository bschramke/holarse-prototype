require 'spec_helper'

describe ServiceController do

  describe "GET 'minecraft'" do
    it "returns http success" do
      get 'minecraft'
      response.should be_success
    end
  end

end
