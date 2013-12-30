#encoding: utf-8
require "spec_helper"

describe "intro", type: :feature do
  it "is accessible on the frontpage" do
    visit root_path
    click_link "Zeige mir eine Einführung"
    
    page.should have_content "Einführung zu Holarse" 
  end
end
