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

    expect(page).to have_content("Tour created.")
  end
end
