require 'rails_helper'

RSpec.describe Pizza, type: :model do
	#Verify presence
	it { should validate_presence_of(:pizza_type) }
end
