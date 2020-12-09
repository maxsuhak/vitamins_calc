require 'rails_helper'

RSpec.describe Recipe::ShowSerializer do
  let(:user) { create(:user) }
  let(:keys) do
    %i[
      vitamin_c
      vitamin_d3
      iron
      food_intake_vitamin_c
      food_intake_vitamin_d3
      food_intake_iron
      activity_level_vitamin_c
      activity_level_vitamin_d3
      activity_level_iron
      vitamin_c_diff
      vitamin_d3_diff
      iron_diff
      date
    ]
  end

  let(:serializer) do
    recipe = RecipeService.new(user: user).run
    serializer = described_class.new(recipe)
    serializer.serializable_hash
  end

  before do
    create(:activity_level, user: user, vitamin_c: 1, vitamin_d3: 1, iron: 1)
    create(:food_intake, user: user, vitamin_c: 4, vitamin_d3: 4, iron: 4)
  end

  it 'keys count should be 13' do
    expect(serializer.keys.count).to eq(13)
  end

  it 'has appropriate serialize attributes' do
    expect(serializer.keys).to eq(keys)
  end
end
