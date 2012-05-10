require 'spec_helper'

describe MediaController do

  describe "GET 'video'" do
    it "returns http success" do
      get 'video'
      response.should be_success
    end
  end

end
