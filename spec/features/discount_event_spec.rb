# encoding: utf-8
require 'spec_helper'

describe "discount page", type: :feature do

  it "shows an overview" do
    de1 = Fabricate(:discount_event)
    de2 = Fabricate(:discount_event)
    de3 = Fabricate(:discount_event)

    visit discount_events_path
    page.should have_content "Rabattaktionen bei Linuxspielen"
    page.should have_content de1.name
    page.should have_content de2.name
    page.should have_content de3.name
  end

end

