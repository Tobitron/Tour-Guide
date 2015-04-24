class StopSerializer < ActiveModel::Serializer
  attributes :name, :description, :latitude, :longitude, :stop_length

  def stop_number(tour)
    tour.tour_stops.find_by(stop: self).stop_number
  end
end
