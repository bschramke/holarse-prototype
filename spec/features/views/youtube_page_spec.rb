require 'spec_helper'

describe "that the youtube page is available", :type => :feature do

  it "should be available" do
    visit '/'
    click_link 'Youtube'
    
    expect(page).to have_content("Videos von Holarse & Co.")
  end

end
