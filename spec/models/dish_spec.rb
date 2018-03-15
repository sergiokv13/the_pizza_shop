require 'rails_helper'

RSpec.describe Dish, type: :model do

	let(:valid_attributes)  { {name: Faker::Food} }

	#Verify presence
	it { should validate_presence_of(:name) }

	#Verify first state set
	it "should set state attribute" do
		dish = Dish.create! valid_attributes
		expect(dish).to have_attributes(:state => "In preparation")
	end

end
