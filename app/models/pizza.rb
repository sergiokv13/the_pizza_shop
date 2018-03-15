class Pizza < ApplicationRecord
	validates :pizza_type, presence: true
end
