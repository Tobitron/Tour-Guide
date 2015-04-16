require 'rails_helper'

feature 'user visits home page and views all tours' do

  scenario 'tours are present (which should always be the case)' do
    FactoryGirl.create(:tour)
    visit root_path

    expect(page).to have_content('San Francisco Bars')
  end
end
