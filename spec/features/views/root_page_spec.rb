require 'spec_helper'

describe "that the root page is available", :type => :feature do

  it "should be available" do
    visit '/'
    expect(page).to have_content("Holarse")
  end

end
