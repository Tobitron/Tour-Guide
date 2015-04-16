class Tour < ActiveRecord::Base
  has_many :tour_stops, dependent: :destroy
  has_many :stops, through: :tour_stops, dependent: :destroy
  
  validates :user, presence: true
  validates :name, presence: true

  def owner?(current_user)
    self.user_id == current_user.id unless current_user == nil
  end

end
