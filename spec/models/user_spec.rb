require 'spec_helper'
require 'digest'

describe User do
  
  it "has an username" do
    user = build(:user, :username => nil)
    user.save.should be_false
  end
  
  it "has an unique username" do
    user = build(:user, :username => "testuser")
    user.save.should be_true
    
    user2 = build(:user, :username => "testuser")
    user2.save.should be_false
  end
  
  it "has an email address" do
    user = build(:user, :email => nil)
    user.save.should be_false
  end  
  
  it "has an unique email address" do
    user = build(:user, :email => "test@test.com")
    user.save.should be_true
    
    user2 = build(:user, :email => "test@test.com")
    user2.save.should be_false
  end
  
  it "should save an encrypted password" do
    user = create(:user, :password => "test")
    user.save
    
    user2 = User.find(user.id)
    user2.password.should_not eq("test")
  end
  
  it "should authenticate with an legacy password" do
    user = build(:user, :old_password_hash => Digest::MD5.hexdigest("test123old"))
    user.authenticate_legacy("test123old").should be_true
  end
  
  it "should migrate a legacy password and delete it" do
    user = build(:user)
    user.migrate_password("test123old")
    user.old_password_hash.should_not be_nil
  end
  
  it "should migrate only if a legacy password is given" do
    user = build(:user, :old_password_hash => nil)
    lambda {
      user.migrate_password("test123old")
    }.should raise_error
  end

  it "should disallow authentication for disabled users and legacy passwords" do
    user = build(:user, :old_password_hash => Digest::MD5.hexdigest("test123old"), :active => false)
    user.authenticate_legacy("test123old").should be_false
  end
  
  it "should disallow authentication for disabled users" do
    user = build(:user, :password => "test123", :active => false)
    user.do_authenticate("test123").should be_false
  end
  
  it "should not have a signature larger than 140 characters" do
    user = build(:user, :signature => Forgery(:lorem_ipsum).characters(145))
    user.save.should be_false
  end
  
  it "should not allow computer descriptions larger than 140 characters" do
    user = build(:user, :computer => Forgery(:lorem_ipsum).characters(145))
    user.save.should be_false    
  end
  
  it "should not allow distro descriptions larger than 30 characters" do
    user = build(:user, :distro => Forgery(:lorem_ipsum).characters(35))
    user.save.should be_false        
  end  
  
  it "should not allow minecraft usernames larger than 30 characters" do
    user = build(:user, :minecraft_username => Forgery(:lorem_ipsum).characters(35))
    user.save.should be_false     
  end    

  it "should not allow holarse usernames larger than 20 characters" do
    user = build(:user, :username => Forgery(:lorem_ipsum).characters(25))
    user.save.should be_false        
  end    
  
  it "should not allow citynames larger than 30 characters" do
    user = build(:user, :city => Forgery(:lorem_ipsum).characters(35))
    user.save.should be_false        
  end      
  
  it "should not allow desura usernames larger than 30 characters" do
    user = build(:user, :desura => Forgery(:lorem_ipsum).characters(35))
    user.save.should be_false          
  end    
  
  it "should require a minecraft username when minecraft is active" do
    user = build(:user, :minecraft => true, :minecraft_username => nil)
    user.save.should be_false
  end
  
end
