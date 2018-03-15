class AddPizzaTypeIdToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :pizza_type_id, :integer
  end
end
