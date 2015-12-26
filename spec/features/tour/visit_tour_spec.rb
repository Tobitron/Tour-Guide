require 'rails_helper'

feature 'Feature: user visits a tour\'s show page.' do

  scenario 'tour stops are displayed' do
    tour = FactoryGirl.create(:tour)
    stop = FactoryGirl.create(:stop)
    FactoryGirl.create(:tour_stop, tour_id: tour.id, stop_id: stop.id)
    visit tour_path(tour)

    expect(page).to have_content('San Francisco Bars')
  end
end
