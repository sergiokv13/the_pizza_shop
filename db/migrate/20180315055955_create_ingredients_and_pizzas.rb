class CreateIngredientsAndPizzas < ActiveRecord::Migration[5.1]

    create_table :ingredients_pizzas, id: false do |t|
      t.belongs_to :pizza, index: true
      t.belongs_to :ingredient, index: true
    end
end
