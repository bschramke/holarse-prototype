require 'spec_helper'

describe HolarseServiceController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'mumble'" do
    it "returns http success" do
      get 'mumble'
      response.should be_success
    end
  end

  describe "GET 'jabber'" do
    it "returns http success" do
      get 'jabber'
      response.should be_success
    end
  end

  describe "GET 'minecraft'" do
    it "returns http success" do
      get 'minecraft'
      response.should be_success
    end
  end

end
