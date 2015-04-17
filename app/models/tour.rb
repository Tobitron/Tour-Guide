class Tour < ActiveRecord::Base
  has_many :tour_stops, dependent: :destroy
  has_many :stops, through: :tour_stops, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true

  def owner?(current_user)
    self.user_id == current_user.id unless current_user == nil
  end

  def new_stop_number
    if tour_stops.last == nil
      new_stop = 1
    else
      new_stop = tour_stops.last.stop_number + 1
    end
  end

end
