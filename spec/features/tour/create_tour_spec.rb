require 'rails_helper'

feature 'Feature: user creates a tour.' do

  scenario 'User signs in and creates a tour' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    click_button "New Tour"
    fill_in "name", with: "The Test Tour"
    click_button "Create Tour"

    expect(page).to have_content("Tour Created.")
  end

  scenario 'user tries to delete a tour that they did not create' do
    click_button "New Tour"

    expect(page).to have_content("Log in")
  end
end
