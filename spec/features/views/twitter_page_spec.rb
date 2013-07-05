require 'spec_helper'

describe "that the twitter page is available", :type => :feature do

  it "should be available" do
    visit '/'
    click_link 'Twitter'
    
    expect(page).to have_content("Linuxgaming Twitter-Wall")
  end

end
