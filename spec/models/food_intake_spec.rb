require 'rails_helper'

RSpec.describe FoodIntake, type: :model do
  it { should belong_to(:user) }

  it_behaves_like 'constants'
  it_behaves_like 'validations', 4..10
end
