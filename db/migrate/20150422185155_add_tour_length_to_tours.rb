class AddTourLengthToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_length, :integer, default: 0
  end
end
