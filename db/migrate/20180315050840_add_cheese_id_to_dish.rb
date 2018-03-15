class AddCheeseIdToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :cheese_id, :integer
  end
end
