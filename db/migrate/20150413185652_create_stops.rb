class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :name
      t.string :description
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :stop_length, null: false
    end
  end
end
