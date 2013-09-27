require 'spec_helper'

describe HolarseApiController do

  describe "GET 'autolinkable'" do
    it "returns http success" do
      get 'autolinkable'
      response.should be_success
    end
  end

  describe "GET 'discount_count'" do
    it "returns http success" do
      get 'discount_count'
      response.should be_success
    end
  end

  describe "GET 'markup_preview'" do
    it "returns http success" do
      get 'markup_preview'
      response.should be_success
    end
  end

end
