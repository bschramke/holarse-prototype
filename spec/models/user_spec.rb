require 'spec_helper'

describe User do

  it "should require a username" do
    Fabricate.build(:user, username: nil).should_not be_valid
  end

  it "should have an admin user with admin-role" do
    admin_user = Fabricate.build(:admin_user)
    expect(admin_user.roles.select{ |role| role.name == "admin" }.size).to eq(1)
  end

  it "should not allow a minecraft whitelisting without minecraftusername" do
    user = Fabricate.build(:user, minecraft_username: nil)
    user.minecraft_whitelisted = true
    user.should_not be_valid
  end

  it "should avoid duplicate minecraft usernames" do
    user = Fabricate(:user, minecraft_username: "abc")
    user.should be_valid

    user2 = Fabricate.build(:user, minecraft_username: "abc")
    user2.should_not be_valid
  end

end
