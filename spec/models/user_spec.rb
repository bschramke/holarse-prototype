require 'spec_helper'

describe User do

  it "should require a username" do
    Fabricate.build(:user, username: nil).should_not be_valid
  end

  it "should have an admin user with admin-role" do
    admin_user = Fabricate.build(:admin_user)
    expect(admin_user.roles.select{ |role| role.name == "admin" }.size).to eq(1)
  end

  it "should not list minecraft accounts without minecraftusername" do
    user = Fabricate.build(:user, minecraft_username: nil)
    user.minecraft_whitelisted = true

    expect(user.valid_minecraft_account?).to be false
  end

  it "should list a minecraft account with mc-username and whitelisted-flag" do
    user = Fabricate.build(:user, minecraft_username: "abc", minecraft_whitelisted: true)

    expect(user.valid_minecraft_account?).to be true
  end

end
