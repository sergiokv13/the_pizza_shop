class AddNonPizzaIdToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :non_pizza_id, :integer
  end
end
