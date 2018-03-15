class AddSizeIdToPizza < ActiveRecord::Migration[5.1]
  def change
    add_column :pizzas, :size_id, :integer
  end
end
