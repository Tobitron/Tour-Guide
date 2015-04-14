class Stop < ActiveRecord::Base
  has_many :tour_stops
  has_many :tours, through: :tour_stops

  def get_stop_number(tour, stop)
    TourStop.where(tour_id: tour, stop_id: stop).first.stop_number
  end

end
