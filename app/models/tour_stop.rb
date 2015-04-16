class TourStop < ActiveRecord::Base
  belongs_to :tour
  belongs_to :stop

  validates :stop_number, presence: true, numericality: { only_integer: true }

end
