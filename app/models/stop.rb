class Stop < ActiveRecord::Base
  has_many :tour_stops
  has_many :tours, through: :tour_stops
end
