class AddCategoriesToTours < ActiveRecord::Migration
  def change
    add_column :tours, :category, :string
  end
end
