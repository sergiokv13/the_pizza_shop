class Pizza < ApplicationRecord
	validates :pizza_type, presence: true
	#The relation as belong is made to avoid data redundancy in the following tables
	belongs_to :cheese
	belongs_to :sauce
	belongs_to :crust
	belongs_to :size 

	has_and_belongs_to_many :ingredients
end
