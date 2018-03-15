class AddCheeseIdToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :cheese_id, :integer
  end
end
