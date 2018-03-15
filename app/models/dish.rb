class Dish < ApplicationRecord
	validates :name, presence: true
	#The relation as belong is made to avoid data redundancy in the pizza table
	belongs_to :pizza, optional: true
	
	
	#Set the default value for state of a dish 
	before_validation do
	   self.state = "In preparation"
	end

end
