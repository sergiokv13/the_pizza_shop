class Dish < ApplicationRecord
	validates :name, presence: true
	#The relation as belong is made to avoid data redundancy in the other tables
	belongs_to :pizza, optional: true
	belongs_to :cheese, optional: true
	belongs_to :sauce, optional: true
	belongs_to :crust, optional: true
	belongs_to :size, optional: true
	
	#Set the default value for state of a dish 
	before_validation do
	   self.state = "In preparation"
	end

end
