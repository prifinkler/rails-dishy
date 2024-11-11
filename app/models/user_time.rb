class UserTime < ApplicationRecord
  belongs_to :user

  validates :max_cooking_time, numericality: { only_integer: true, allow_nil: true, greater_than: 0 }
end
