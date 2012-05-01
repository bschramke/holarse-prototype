require 'spec_helper'

describe Wine do
  it "should have these fields" do
    should have_fields(:url, :maxrating)
    should have_field(:versions).of_type(Array)
  end
  
  it "should be embedded in article" do
    should be_embedded_in(:article)
  end    
end
