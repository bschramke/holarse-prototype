# encoding: utf-8
require "spec_helper"

feature "Register" do
 
  scenario "Register a new user" do
    visit "/"
    click_link "Registrieren"
    within("#new_user") do
      fill_in "Benutzername", :with => "capybara"
      fill_in "Email-Adresse", :with => "capybara@testuser.com"
      fill_in "Passwort", :with => "test123"
      fill_in "Bestätigung Passwort", :with => "test123"
    end
    click_button "Abschicken"
    expect(page).to have_content "Benutzer capybara wurde erstellt."

    u = User.find_by_username("capybara")
    u.should be_valid
  end

  scenario "Login the new user" do
    visit "/"
    click_link "Anmelden"
    within("#new_session") do
      fill_in "Username", :with => "capybara"
      fill_in "Password", :with => "test123"
    end
    click_button "Submit Session"
    expect(page).to have_content "Der Login war erfolgreich"
  end
  
end
