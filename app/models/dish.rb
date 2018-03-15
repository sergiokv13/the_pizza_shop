class Dish < ApplicationRecord
	 validates :name, presence: true

	#Set the default value for state of a dish 
	before_validation do
	   self.state = "In preparation"
	 end

end
