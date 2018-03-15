require 'rails_helper'

RSpec.describe NonPizza, type: :model do
  	#Verify presence
	it { should validate_presence_of(:name) }
end
