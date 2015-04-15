class Stop < ActiveRecord::Base
  has_many :tour_stops
  has_many :tours, through: :tour_stops

  def new_stop_number
    if tour_stops.last == nil
      new_stop = 1
    else
      new_stop = tour.tour_stops.last.stop_number + 1
    end
  end
end
