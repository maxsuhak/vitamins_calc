require 'rails_helper'

RSpec.describe RecipeService do
  let(:user) { create(:user) }

  subject(:recipe) { described_class.new(user: user) }

  it 'generates recipe w/o food_intakes and activity_levels' do
    expect(recipe.run.attributes.compact.symbolize_keys).to include_json(
      user_id: user.id,
      vitamin_c: 10,
      vitamin_d3: 10,
      iron: 10
    )
  end

  it 'generates recipe with food_intakes and activity_levels' do
    create(:activity_level, user: user, vitamin_c: 1, vitamin_d3: 1, iron: 1)
    create(:food_intake, user: user, vitamin_c: 4, vitamin_d3: 4, iron: 4)

    expect(recipe.run.attributes.compact.symbolize_keys).to include_json(
      user_id: user.id,
      vitamin_c: 7,
      vitamin_d3: 7,
      iron: 7
    )
  end

  it 'generates recipe with food_intakes and activity_levels and then updates generated recipe with new data' do
    create(:activity_level, user: user, vitamin_c: 1, vitamin_d3: 1, iron: 1)
    create(:food_intake, user: user, vitamin_c: 4, vitamin_d3: 4, iron: 4)

    r1 = described_class.new(user: user)

    expect(r1.run.attributes.compact.symbolize_keys).to include_json(
      user_id: user.id,
      vitamin_c: 7,
      vitamin_d3: 7,
      iron: 7
    )

    create(:activity_level, user: user, vitamin_c: 1, vitamin_d3: 1, iron: 3)
    create(:food_intake, user: user, vitamin_c: 7, vitamin_d3: 4, iron: 8)

    r2 = described_class.new(user: user)

    expect(r2.run.attributes.compact.symbolize_keys).to include_json(
      user_id: user.id,
      vitamin_c: 1,
      vitamin_d3: 4,
      iron: 2
    )
  end
end
