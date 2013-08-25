require 'spec_helper'

describe User do

  it "should require a username" do
    Fabricate.build(:user, username: nil).should_not be_valid
  end

  it "should have an admin user with admin-role" do
    admin_user = Fabricate.build(:admin_user)
    expect(admin_user.roles.select{ |role| role.name == "admin" }.size).to eq(1)
  end

end
