class Ingredient < ApplicationRecord
  has many :users, through: :ingredients_users
  has many :recipes , through: :ingredients_recipes

  validates :name, presence: true, length: { minimum: 2}
end
