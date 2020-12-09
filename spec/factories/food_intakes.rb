FactoryBot.define do
  factory :food_intake do
    user
    vitamin_c { rand(4..10) }
    vitamin_d3 { rand(4..10) }
    iron { rand(4..10) }
  end
end
