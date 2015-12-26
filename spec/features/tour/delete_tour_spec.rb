require 'rails_helper'

feature 'Feature: user deletes a tour' do

  scenario 'user deletes a tour that they created' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    tour = FactoryGirl.create(:tour, user_id: user.id)
    visit tour_path(tour)
    click_link "Delete Tour"
    expect(page).to have_content("Tour Deleted")
  end

  scenario 'user tries to delete a tour that they did not create' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    tour = FactoryGirl.create(:tour, user_id: user.id)
    sign_out_as user
    visit tour_path(tour)
    expect(page).to_not have_content("Delete Tour")
  end
end
