class CreateTourStops < ActiveRecord::Migration
  def change
    create_table :tour_stops do |t|
      t.integer :tour_id, null: false
      t.integer :stop_id, null: false
      t.integer :stop_number, null: false
    end
  end
end
