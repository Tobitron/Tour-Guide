class AddTourDistanceToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_distance, :float, default: 0
  end
end
