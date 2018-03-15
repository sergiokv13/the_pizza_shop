require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  	#Verify relation with Pizza
	it { should have_and_belong_to_many(:pizzas) }
end
