require 'rails_helper'

RSpec.describe Pizza, type: :model do
	#Verify presence
	it { should validate_presence_of(:pizza_type) }

	#Verify relation with Cheese
	it { should belong_to(:cheese) }
	#Verify relation with Cheese
	it { should belong_to(:sauce) }
	#Verify relation with Cheese
	it { should belong_to(:crust) }
	#Verify relation with Cheese
	it { should belong_to(:size) }
	#Verify relation with Ingrefients
	it { should have_and_belong_to_many(:ingredients) }

end
