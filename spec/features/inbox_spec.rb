#encoding: utf-8
require "spec_helper"

describe "inbox pages", type: :feature do
  it "shows the inbox overview" do
    visit inboxes_path
    
    page.should have_content "Die neusten Einreichungen"
  end
end

describe "Visitor wants to write a new notification", type: :feature do
  it "is accessible on the root page" do
    visit root_path
    click_link "Neuigkeiten einreichen"

    page.should have_content "Neuigkeiten einreichen"
  end

  it "should automatically fill the username if logged in" do
    # login
    user = Fabricate(:user)
    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: user.password
    end
    click_button "Anmelden"
    page.should have_content "Login war erfolgreich"

    # new inbox
    visit new_inbox_path
    page.should have_field("Absender", with: user.username)
  end

  it "should save the inbox message" do
    count_before = Inbox.count

    inbox = Fabricate(:inbox)
    visit new_inbox_path

    Rails.logger.debug("inbox: #{inbox.inspect}")

    within("#new_inbox") do
      fill_in "Absender", with: inbox.sender
      fill_in "Web-Adresse", with: inbox.url
      fill_in "Info-Text", with: inbox.info
    end

    click_button "Einreichen"
    page.should have_content "Aktuelle Einreichungen"

    expect(Inbox.count).to eq(count_before + 1)
  end
end
