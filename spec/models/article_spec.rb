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
  
  it "should not be updatable when frozen" do
    article = build(:article, :frozen => true)
    article.title = "test123"
    article.save.should be_false
  end

  it "should not be updatable when disabled" do
    article = build(:article, :disabled => true)
    article.title = "lalala"
    article.save.should be_false
  end
  
  it "should be unfreezable for admins" do
    article = build(:article, :frozen => true)
    article.frozen = false
    article.author = build(:user, :roles => ["admin"])
    article.save.should be_true
  end
  
  it "should be able to enable for admins" do
    article = build(:article, :disabled => true)
    article.disabled = false
    article.author = build(:user, :roles => ["admin"])
    article.save.should be_true
  end  
  
  it "should require admin-role to unfreeze" do
    article = build(:article, :frozen => true)
    article.frozen = false
    article.author = build(:user, :roles => ["rhababer"])
    article.save.should be_false
  end
  
  it "should require admin-role to enable" do
    article = build(:article, :disabled => true)
    article.disabled = false
    article.author = build(:user, :roles => ["lala"])
    article.save.should be_false
  end  
  
  it "should require admin-roles to disable" do
    article = build(:article, :disabled => false)
    article.author = build(:user, :roles => ["lala"])
    article.disabled = true
    article.save.should be_false
  end
  
  it "should require admin-roles to freeze" do
    article = build(:article, :frozen => false)
    article.author = build(:user, :roles => ["lala"])
    article.frozen = true
    article.save.should be_false    
  end

end
