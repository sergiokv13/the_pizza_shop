require 'rails_helper'

RSpec.describe Dish, type: :model do
	let(:valid_attributes)  { { pizza_id: 1} }
	let(:invalid_attributes) { {pizza_id: nil,non_pizza_id: nil} }
	#Verify first state set
	it "should set state attribute" do
		dish = Dish.create! valid_attributes
		expect(dish).to have_attributes(:state => "In preparation")
	end

	#Verify validation
	it "raises an error if there is no dish in the order" do
	 	dish = Dish.new
	 	expect(dish).to_not be_valid
	end

	#Verify relation with Pizza
	it { should belong_to(:pizza) }

	#Verify relation with NonPizza
	it { should belong_to(:non_pizza) }

	#Verify next state
	context "with state delivery" do
      it "changes for the first time " do
       	dish = Dish.create! valid_attributes
       	dish.next_state(true)
       	expect(dish).to have_attributes(:state => "Bake it")
      end

      it "changes for the second time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(true)
       	dish.next_state(true)
       	expect(dish).to have_attributes(:state => "Cut it")
      end

      it "changes for the third time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(true)
       	dish.next_state(true)
       	dish.next_state(true)
       	expect(dish).to have_attributes(:state => "Box it")
      end

       it "changes for the last time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(true)
       	dish.next_state(true)
       	dish.next_state(true)
       	dish.next_state(true)
       	expect(dish).to have_attributes(:state => "Delivery")
      end

    end

	context "with state delivery" do
      it "changes for the first time " do
       	dish = Dish.create! valid_attributes
       	dish.next_state(false)
       	expect(dish).to have_attributes(:state => "Bake it")
      end

      it "changes for the second time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(false)
       	dish.next_state(false)
       	expect(dish).to have_attributes(:state => "Cut it")
      end

      it "changes for the third time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(false)
       	dish.next_state(false)
       	dish.next_state(false)
       	expect(dish).to have_attributes(:state => "Box it")
      end

       it "changes for the last time" do
       	dish = Dish.create! valid_attributes
       	dish.next_state(false)
       	dish.next_state(false)
       	dish.next_state(false)
       	dish.next_state(false)
       	expect(dish).to have_attributes(:state => "Dispatched")
      end

    end



end