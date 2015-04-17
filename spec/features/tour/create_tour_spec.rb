require 'rails_helper'

feature 'Feature: user creates a tour.' do

  scenario 'User signs in and creates a tour' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_tour_path
    fill_in "Name", with: "The Test Tour"
    click_button "Create Tour"

    expect(page).to have_content("Tour Created.")
  end

  scenario 'user tries to delete a tour that they did not create' do
    visit root_path
    click_button "New Tour"

    expect(page).to have_content("Log in")
  end
end
