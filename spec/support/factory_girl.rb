require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :tour do
    name 'San Francisco Bars'
    user_id 1
  end

  factory :stop do
    name 'Zeitgeist'
    description 'Kick ass outdoor bar, great selection of $4.50 beers.'
    latitude 37.770005
    longitude -122.422120
    stop_length 120
  end

  factory :tour_stop do
    tour_id 1
    stop_id 1
    stop_number 1
  end

end
