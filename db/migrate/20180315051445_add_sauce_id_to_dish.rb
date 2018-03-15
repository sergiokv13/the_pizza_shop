class AddSauceIdToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :sauce_id, :integer
  end
end
