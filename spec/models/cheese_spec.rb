require 'rails_helper'

RSpec.describe Cheese, type: :model do
  	#Verify presence
	it { should validate_presence_of(:name) }
end
