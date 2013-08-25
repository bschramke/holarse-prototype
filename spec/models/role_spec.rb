require 'spec_helper'

describe Role do
  it "should require a name" do
    role = Fabricate.build(:role, name: nil)
    role.should_not be_valid
  end

  it "should have unique names" do
    role1 = Fabricate(:role, name: "abc")
    role1.save

    role2 = Fabricate.build(:role, name: "abc")
    role2.should_not be_valid
  end

end
