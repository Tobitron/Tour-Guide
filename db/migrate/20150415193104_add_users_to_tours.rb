class AddUsersToTours < ActiveRecord::Migration
  def change
    add_column :tours, :user_id, :integer, null: false
  end
end
