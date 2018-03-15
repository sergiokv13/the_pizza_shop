class AddCrustIdToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :crust_id, :integer
  end
end
