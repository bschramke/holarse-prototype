#encoding: utf-8
require "spec_helper"

describe "imprint", type: :feature do
  it "is accessible on the frontpage" do
    visit root_path
    click_link "Impressum"
    
    page.should have_content "Impressum"
  end
end
