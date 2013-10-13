require "spec_helper"

describe TogetherjsHelper do

  it "checks for opted-in users" do
    user = Fabricate(:user, collaborate: false)
    expect(helper.user_wants_to_collaborate? user).to be_false
  end

  it "checks if user wants to collaborate" do
    user = Fabricate(:user, collaborate: true)
    expect(helper.user_wants_to_collaborate? user).to be_true
  end
end
