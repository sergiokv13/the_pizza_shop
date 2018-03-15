class AddPizzaIdToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :pizza_id, :integer
  end
end
