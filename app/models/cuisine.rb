class Cuisine < ApplicationRecord
  has many :users, through: :cuines_users
  has many :recipes, through: :cuisines_recipes

  validates :name, presence: true, length: { minimum: 2}
end
