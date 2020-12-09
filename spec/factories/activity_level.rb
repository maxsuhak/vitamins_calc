FactoryBot.define do
  factory :activity_level do
    user
    vitamin_c { rand(1..3) }
    vitamin_d3 { rand(1..3) }
    iron { rand(1..3) }
  end
end
