class TourSerializer < ActiveModel::Serializer
  attributes :name, :category, :tour_length, :tour_distance

  has_many :tour_stops
end
