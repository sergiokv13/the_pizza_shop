class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string :name
      t.integer :slices

      t.timestamps
    end
  end
end
