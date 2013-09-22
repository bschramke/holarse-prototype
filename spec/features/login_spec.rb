# encoding: utf-8
require 'spec_helper'

describe "the signin process", :type => :feature do

  it "signs me in" do
    user = Fabricate(:user)

    visit login_path
    within("#new_session") do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
    end

    click_button "Submit Session"
    page.should have_content "Login war erfolgreich"
  end

  it "rejects me with a wrong password" do
    user = Fabricate(:user)

    visit login_path
    within("#new_session") do
      fill_in "Username", with: user.username
      fill_in "Password", with: "falsches passwort"
    end

    click_button "Submit Session"
    page.should have_content "Der Login ist leider fehlgeschlagen"
  end

  it "rejects me with a not-existing user" do
    visit login_path
    within("#new_session") do
      fill_in "Username", with: "nicht existenter benutzer"
      fill_in "Password", with: "falsches passwort"
    end

    click_button "Submit Session"
    page.should have_content "Der Login ist leider fehlgeschlagen"
  end 

end
