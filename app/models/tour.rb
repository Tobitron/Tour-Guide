include ActionView::Helpers::DateHelper
class Tour < ActiveRecord::Base
  has_many :tour_stops, dependent: :destroy
  has_many :stops, through: :tour_stops, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true

  # scope :tour_by_category, ->(category) { where(category: category) }
  # scope :category_by_ten, ->(cat) { tour_by_category(cat).limit(10) }

  def owner?(current_user)
    self.user_id == current_user.id unless current_user == nil
  end

  # def signed_in?
  #   current_user
  # end

  def new_stop_number
    if tour_stops.last == nil
      new_stop = 1
    else
      new_stop = tour_stops.last.stop_number + 1
    end
    # refactor to find correct num by tour_stops count
  end

  def self.get_tour_by_category(category)
    where(category: category)
  end

  def calculate_tour_time(tour_legs_params, tour)
    transit_time = 0
    tour_legs_params.values.each do |length|
      transit_time += length[:value].to_i
    end

    time_spent_at_stop = 0
    stops = @tour.stops

    stops.each do |stop|
      time_spent_at_stop += stop.stop_length
    end

    total_tour_time = (time_spent_at_stop * 60) + transit_time

  end

  def tour_length_in_minutes
    # sum up tour time
  end

  def self.get_food_drinks_tours
    where(category: "Food/Drinks").limit(10)
  end

  def tour_length_in_minutes
    # sum up tour time
  end
end
