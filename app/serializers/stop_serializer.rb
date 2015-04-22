class StopSerializer < ActiveModel::Serializer
  attributes :name, :description, :latitude, :longitude, :stop_length
end
