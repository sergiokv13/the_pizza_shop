class Pizza < ApplicationRecord
	validates :pizza_type, presence: true
	#The relation as belong is made to avoid data redundancy in the following tables
	belongs_to :cheese, optional: true
	belongs_to :sauce, optional: true
	belongs_to :crust, optional: true
	belongs_to :size, optional: true
end
