class StopsData

  def self.get_data(tour)
    stops = tour.stops
    stop_nums = tour.tour_stops
    tour = []

    stops.each_with_index do |stop, i|
      tour[i] = {}
      tour[i][:name] = stop.name
      tour[i][:div_id] = stop.name.parameterize.underscore
      tour[i][:description] = stop.description
      tour[i][:latitude] = stop.latitude
      tour[i][:longitude] = stop.longitude
      tour[i][:stop_length] = stop.stop_length
    end

    # Add stop number to my array of tour stop hashes
    tour.each_with_index do |stop, i|
      stop[:stop_number] = stop_nums[i].stop_number
    end
    tour
  end
end
