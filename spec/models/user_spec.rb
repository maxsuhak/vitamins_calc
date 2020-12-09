require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:food_intakes).dependent(:destroy) }
  it { should have_many(:activity_levels).dependent(:destroy) }
  it { should have_many(:recipes).dependent(:destroy) }
end
