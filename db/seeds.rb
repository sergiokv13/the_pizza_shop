#Cheeses
Cheese.create(name: "Cheddar")
Cheese.create(name: "Swiss")
Cheese.create(name: "Provolone")

#Sauces
Sauce.create(name: "BQB")
Sauce.create(name: "Honey Mustard")
Sauce.create(name: "Hot")
Sauce.create(name: "Garlic Parmessan")

#Crust
Crust.create(name: "Thin")
Crust.create(name: "Thick")
Crust.create(name: "Filled with cheese")

#Sizes
Size.create(name: "Personal")
Size.create(name: "Small")
Size.create(name: "Medium")
Size.create(name: "Large")


Crust.create(name: "Thin")
Crust.create(name: "Thick")
Crust.create(name: "Filled with cheese")

#Ingredients
(1..15).each do
	Ingredient.create(name: Faker::Food.ingredient)	
end

#Pizza types
PizzaType.create(name: "Hawaiian")
PizzaType.create(name: "Brazilian")
PizzaType.create(name: "Veggie")

#NonPizza
NonPizza.create(name: "Spaghetti")
NonPizza.create(name: "Salad")
NonPizza.create(name: "SLasagna")