class AddCrustIdToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :crust_id, :integer
  end
end
