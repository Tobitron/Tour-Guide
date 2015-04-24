class TourSerializer < ActiveModel::Serializer
  attributes :name, :category, :tour_length_in_minutes
    
  has_many :tour_stops
end
