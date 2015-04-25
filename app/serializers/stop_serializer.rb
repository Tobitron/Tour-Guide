class StopSerializer < ActiveModel::Serializer
  attributes :name, :description, :latitude, :longitude, :stop_length, :div_id

  def div_id
    object.name.parameterize.underscore
  end

  def stop_number(tour)
    tour.tour_stops.find_by(stop: self).stop_number
  end
end
