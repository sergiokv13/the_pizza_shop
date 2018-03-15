require 'rails_helper'

RSpec.describe Size, type: :model do
  #Verify presence
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:slices) }
end