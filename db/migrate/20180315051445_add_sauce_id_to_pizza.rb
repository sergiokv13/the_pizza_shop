class AddSauceIdToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :sauce_id, :integer
  end
end
