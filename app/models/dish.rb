class Dish < ApplicationRecord
	#The relation as belong is made to avoid data redundancy in the pizza table
	belongs_to :pizza, optional: true
	belongs_to :non_pizza, optional: true
	
	
	#Set the default value for state of a dish 
	after_create do
	   self.state = "In preparation"
	end

	#Function to change state to the next one when ended process
	#delivery is boolean
	def next_state (delivery)
		if self.state == "Box it" && delivery then self.state = "Delivery" end
		if self.state == "Box it" && !delivery then self.state = "Dispatched" end
		if self.state == "Cut it" then self.state = "Box it" end
		if self.state == "Bake it" then self.state = "Cut it" end
		if self.state == "In preparation" then self.state = "Bake it" end
		self.save
	end		
	
end