require 'spec_helper'

describe Newsupdate do
  
  it "should require an author-name" do
    should validate_presence_of(:author)
  end
  
  it "should have videos" do
    should embed_many(:videos)
  end
  
  it "should be timestamped" do
    should be_timestamped_document    
  end   
  
  it "should have links" do
    should embed_many(:links)
  end  
  
  it "should have screenshots" do
    should embed_many(:screenshots)
  end
  
  it "should have attachments" do
    should embed_many(:attachments)
  end
  
  it "should have content" do
    should have_fields(:content)
    should validate_presence_of(:content)
  end
  
  it "should have at least 10 characters of content" do
    should validate_length_of(:content).with_minimum(10)
  end

end
