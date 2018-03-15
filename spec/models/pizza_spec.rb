require 'rails_helper'

RSpec.describe Pizza, type: :model do
	#Verify relation with Cheese
	it { should belong_to(:cheese) }
	#Verify relation with Sauce
	it { should belong_to(:sauce) }
	#Verify relation with Crust
	it { should belong_to(:crust) }
	#Verify relation with Size
	it { should belong_to(:size) }
	#Verify relation with PizzaType
	it { should belong_to(:pizza_type) }
	#Verify relation with Ingrefients
	it { should have_and_belong_to_many(:ingredients) }

end
