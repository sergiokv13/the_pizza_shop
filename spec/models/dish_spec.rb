require 'rails_helper'

RSpec.describe Dish, type: :model do

	#Verify first state set
	it "should set state attribute" do
		dish = Dish.create! 
		expect(dish).to have_attributes(:state => "In preparation")
	end

	#Verify relation with Pizza
	it { should belong_to(:pizza) }

	#Verify relation with NonPizza
	it { should belong_to(:non_pizza) }


end