class AddTimestampToTours < ActiveRecord::Migration
  def change
    add_column(:tours, :created_at, :datetime)
    add_column(:tours, :updated_at, :datetime)
  end
end
