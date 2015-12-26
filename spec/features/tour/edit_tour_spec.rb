require 'rails_helper'

feature 'Feature: user edits a tour.' do

  scenario 'User edits a tour that they created' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    tour = FactoryGirl.create(:tour, user_id: user.id)
    visit tour_path(tour)
    click_link "Edit Tour"
    fill_in "Name", with: "Edited Test Tour"
    click_button "Update Tour"

    expect(page).to have_content("Tour Updated")
  end

  scenario 'user tries to edit a tour that they did not create' do
    user = FactoryGirl.create(:user)
    tour = FactoryGirl.create(:tour)
    visit tour_path(tour)

    expect(page).to_not have_content("Edit Tour")
  end
end
