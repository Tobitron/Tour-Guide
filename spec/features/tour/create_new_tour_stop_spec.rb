require 'rails_helper'

feature 'Feature: Create a new stop for a tour.' do

  scenario 'visit tour as authenticated user stop page and make a new stop' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    tour = FactoryGirl.create(:tour, user_id: user.id)
    visit new_tour_stop_path(tour)

    fill_in 'Name', with: "Toronado"
    fill_in 'Description', with: "An amazing beer selection, they always have Pliny the Elder"
    fill_in 'Latitude', with: 37.771843
    fill_in 'Longitude', with: -122.431185
    fill_in 'Stop length', with: 60
    click_button 'Create Stop'
    expect(page).to have_content("New stop created")
  end

  scenario 'visit tour as non-authenticated user and try to make a new stop' do
    user = FactoryGirl.create(:user)
    sign_in_as user
    tour = FactoryGirl.create(:tour)
    visit tour_path(tour)
    expect(page).to_not have_content("New Stop")
  end
end
