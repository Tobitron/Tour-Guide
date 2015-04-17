class StopSerializer < ActiveModel::Serializer
  attributes :name, :description, :latitude, :longitude, :stop_length

  def get_stop_number

  end

end
