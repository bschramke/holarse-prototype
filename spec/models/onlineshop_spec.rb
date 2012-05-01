require 'spec_helper'

describe Onlineshop do
  it "should have these fields" do
    should have_fields(:name, :url)
  end
  
  it "should be embedded in article" do
    should be_embedded_in(:article)
  end

end
