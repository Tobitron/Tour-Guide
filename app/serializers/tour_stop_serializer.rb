class TourStopSerializer < ActiveModel::Serializer
  attributes :stop_number

  has_one :stop
end
