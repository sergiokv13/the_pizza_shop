class AddSizeIdToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :size_id, :integer
  end
end
