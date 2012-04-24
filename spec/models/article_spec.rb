require 'spec_helper'

describe Article do
  
  it "should require an author" do
    article = build(:article, :author => nil)
    article.save.should be_false    
  end
  
  it "should have a title" do
    article = build(:article, :title => nil)
    article.save.should be_false
  end
  
  it "should have content" do
    article = build(:article, :content => nil)
    article.save.should be_false
  end
  
  it "should have at least one tag" do
    article = build(:article, :tags => nil)
    article.save.should be_false
  end
  
end
