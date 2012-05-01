require 'spec_helper'

describe Screenshot do

  it "should be timestamped" do
    should be_timestamped_document    
  end
  
  it "should save an image" do
    should have_mongoid_attached_file(:img)
  end
  
  it "should save an description" do
    should have_fields(:description)
  end  
  
  it "should be embedded in article" do
    should be_embedded_in(:article)
  end
  
  it "should be embedded in news" do
    should be_embedded_in(:news)
  end  
  
  it "should be embedded in news-update" do
    should be_embedded_in(:newsupdate)
  end    
  
end
