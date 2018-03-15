class Size < ApplicationRecord
	validates :name, :slices, presence: true
end
