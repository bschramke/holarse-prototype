require 'spec_helper'

describe Role do
  it "should require a name" do
    Fabricate(:role, name: nil).should_not be_valid
  end
end
