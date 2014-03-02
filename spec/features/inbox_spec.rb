#encoding: utf-8
require "spec_helper"

describe "inbox pages", type: :feature do
  it "shows the inbox overview" do
    visit inboxes_path
    
    page.should have_content "Die neusten Einreichungen"
  end
end

describe "Visitor wants to pass a new notification", type: :feature do
  it "is accessible on the root page" do
    visit root_path
    click_link "Neuigkeiten einreichen"

    page.should have_content "Neuigkeiten einreichen"
  end


end
