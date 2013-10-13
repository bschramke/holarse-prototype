require 'spec_helper'

describe "that the discountevent page is available", :type => :feature do

  @javascript
  it "should be available" do
    visit '/'
    click_link 'Rabattaktionen'
    
    expect(page).to have_content("Rabattaktionen bei Linuxspielen")
  end

end
