class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :food_intakes, dependent: :destroy
  has_many :activity_levels, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
