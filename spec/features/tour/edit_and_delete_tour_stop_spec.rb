require 'rails_helper'

feature 'Feature: user edits a tour stop.' do

  scenario 'user edits a tour stop that they created' do
    user1 = FactoryGirl.create(:user, email: "user1@gmail.com")
    sign_in_as user1
    tour = FactoryGirl.create(:tour, user_id: user1.id)
    stop = FactoryGirl.create(:stop)
    tour_stop = FactoryGirl.create(:tour_stop, tour_id: tour.id, stop_id: stop.id)
    visit tour_path(tour)
    click_link "Edit Stop"
    fill_in "Name", with: "Edited Stop"
    click_button "Update Stop"

    expect(page).to have_content("Stop Updated")
  end

  # scenario 'user is unable to edit a tour stop they did not create' do
  #   user4 = FactoryGirl.create(:user, email: "user4@gmail.com")
  #   tour = FactoryGirl.create(:tour, user: user4.id)
  #   user2 = FactoryGirl.create(:user, email: "user2@gmail.com")
  #   sign_in_as user2
  #   stop = FactoryGirl.create(:stop)
  #   tour_stop = FactoryGirl.create(:tour_stop, tour_id: tour.id, stop_id: stop.id)
  #   visit tour_path(tour)
  #
  #   expect(page).to_not have_content("Edit Stop")
  # end
end

feature 'Feature: user deletes a tour stop' do

  scenario 'user deletes a tour stop that they created' do
    user3 = FactoryGirl.create(:user, email: "user3@gmail.com")
    sign_in_as user3
    tour = FactoryGirl.create(:tour, user_id: user3.id)
    stop = FactoryGirl.create(:stop)
    tour_stop = FactoryGirl.create(:tour_stop, tour_id: tour.id, stop_id: stop.id)
    visit tour_path(tour)
    click_link "Delete Stop"
    expect(page).to have_content("Stop Deleted")
  end
end
