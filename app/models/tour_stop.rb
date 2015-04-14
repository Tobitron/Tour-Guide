class TourStop < ActiveRecord::Base
  belongs_to :tour
  belongs_to :stop

end
