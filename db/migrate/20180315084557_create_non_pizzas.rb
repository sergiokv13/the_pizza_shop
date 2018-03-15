class CreateNonPizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :non_pizzas do |t|
      t.string :name

      t.timestamps
    end
  end
end
