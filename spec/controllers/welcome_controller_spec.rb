require 'spec_helper'

describe WelcomeController do

  describe "home page" do
    it "welcomes first visit users" do
      visit '/'
      page.should have_content("Willkommen, Linux-Spieler")
    end
  end

end
