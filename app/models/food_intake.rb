class FoodIntake < ApplicationRecord
  belongs_to :user

  scope :todays, ->(user) { where(created_at: Time.zone.today.all_day, user: user).reverse_order }
  scope :for_date, ->(user, date) { where(created_at: date, user: user).reverse_order }

  RANGE = (4..10).freeze

  COLUMNS_TO_VALIDATE = %i[vitamin_c vitamin_d3 iron].freeze

  COLUMNS_TO_VALIDATE.each do |attr|
    validates attr,
              allow_nil: true,
              inclusion: { in: RANGE }
  end
end
