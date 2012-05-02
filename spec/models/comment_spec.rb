require 'spec_helper'

describe Comment do
  
  it "should be timestamped" do
    should be_timestamped_document    
  end   
  
  it "should be embedded into news" do
    should be_embedded_in(:news)
  end

  it "should be embedded into article" do
    should be_embedded_in(:article)
  end  
  
  it "should have fields" do
    should have_fields(:author, :content, :deleted, :released)
  end
  
  it "should require an author" do
    should validate_presence_of(:author)
  end
  
  it "should have at least 10 characters of content" do
    should validate_length_of(:content).with_minimum(10)    
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
  
  it "should have videos" do
    should embed_many(:videos)
  end
  
  
end
