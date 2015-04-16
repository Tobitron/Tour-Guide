class Stop < ActiveRecord::Base
  has_many :tour_stops
  has_many :tours, through: :tour_stops

  validates :user, presence: true
  validates :latitude, presence: true, numericality: { only_integer: true }
  validates :longitude, presence: true, numericality: { only_integer: true }
  validates :stop_length, presence: true, numericality: { only_integer: true }


  def new_stop_number
    if tour_stops.last == nil
      new_stop = 1
    else
      new_stop = tour.tour_stops.last.stop_number + 1
    end
  end
end
