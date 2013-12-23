# encoding: utf-8
require 'spec_helper'

describe "the signin process", :type => :feature do

  it "signs me in" do
    user = Fabricate(:user)

    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: user.password
    end

    click_button "Anmelden"
    page.should have_content "Login war erfolgreich"
  end

  it "rejects me with a wrong password" do
    user = Fabricate(:user)

    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: "falsches passwort"
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist leider fehlgeschlagen"
  end

  it "rejects me with a not-existing user" do
    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: "nicht existenter benutzer"
      fill_in "Passwort", with: "falsches passwort"
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist nicht möglich"
  end 

  it "rejects me with too many failed longs" do
    user = Fabricate(:user, failed_logins: 5)

    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: user.password
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist nicht möglich"
  end

  it "rejects me when the user is disabled" do
    user = Fabricate(:user, active: false)

    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: user.password
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist nicht möglich"
  end


  it "rejects me when i entered nothing" do
    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: ""
      fill_in "Passwort", with: ""
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist nicht möglich"
  end 

  it "rejects me when i entered an empty password" do
    user = Fabricate(:user)
    visit login_path
    within("#new_session") do
      fill_in "Benutzername", with: user.username
      fill_in "Passwort", with: ""
    end

    click_button "Anmelden"
    page.should have_content "Der Login ist leider fehlgeschlagen"
  end 



end
