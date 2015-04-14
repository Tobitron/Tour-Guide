class Tour < ActiveRecord::Base
  has_many :tour_stops
  has_many :stops, through: :tour_stops

end
