class Pizza < ApplicationRecord
	#The relation as belong is made to avoid data redundancy in the following tables
	belongs_to :cheese
	belongs_to :sauce
	belongs_to :crust
	belongs_to :size
	belongs_to :pizza_type

	has_and_belongs_to_many :ingredients

	def add_ingredient(ingredient_id)
		ingredient = Ingredient.find(ingredient_id)		
		self.ingredients.push(ingredient)
	end
	
end
