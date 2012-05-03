require 'spec_helper'

describe Forumthread do

  it "should be timestamped" do
    should be_timestamped_document    
  end

  it "should require an author" do
    should validate_presence_of(:author)
    should belong_to(:author)  
  end
  
  it "should have a title" do
    should validate_presence_of(:title) 
  end
  
  it "should have a forum" do
    should validate_presence_of(:forum) 
  end  
  
  it "should have field roles" do
    should have_fields(:roles)
  end    
  
  it "should have field closed" do
    should have_fields(:closed)
  end      
    
  it "should have at least 10 characters of content" do
    should validate_length_of(:content).with_minimum(10)
  end
  
  it "should have at least 3 characters of title" do
    should validate_length_of(:title).with_minimum(3)
  end   
  
  it "should have content" do
    should validate_presence_of(:content)        
  end
  
  it "should have comments" do
    should embed_many(:comments)
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
