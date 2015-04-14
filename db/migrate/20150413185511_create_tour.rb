class CreateTour < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name, null: false
    end
  end
end
