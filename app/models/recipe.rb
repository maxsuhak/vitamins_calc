class Recipe < ApplicationRecord
  belongs_to :user

  scope :todays, ->(user) { where(created_at: Time.zone.today.all_day, user: user) }
end
