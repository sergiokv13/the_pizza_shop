class Ingredient < ApplicationRecord
	validates :name, presence: true
	has_and_belongs_to_many :pizzas
end
