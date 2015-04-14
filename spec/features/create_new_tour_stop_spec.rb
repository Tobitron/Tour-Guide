require 'rails_helper'

feature 'Create a new stop for a tour.' do

  scenario 'visit new tour stop page and make a new stop' do
    tour = FactoryGirl.create(:tour)
    visit new_tour_stop_path(tour)

    fill_in 'Name', with: "Toronado"
    fill_in 'Description', with: "An amazing beer selection, they always have Pliny the Elder"
    fill_in 'Latitude', with: 37.771843
    fill_in 'Longitude', with: -122.431185
    fill_in 'Stop Length', with: 60
    click_button 'Create Tour Stop'

    FactoryGirl.create(:tour_stop)

  end
end


fill_in 'Body', with: 'This is the most amazing show ever created.'
