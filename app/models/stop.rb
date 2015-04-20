class Stop < ActiveRecord::Base
  has_many :tour_stops
  has_many :tours, through: :tour_stops

  # This isn't working. Figure it out later.
  # validates :latitude, presence: true, numericality: { only_float: true }
  # validates :longitude, presence: true, numericality: { only_float: true }
  validates :stop_length, presence: true, numericality: { only_integer: true }


end
