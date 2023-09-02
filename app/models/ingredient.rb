class Ingredient < ApplicationRecord
  has_many :users, through: :user_ingredients
  has_many :recipes , through: :recipe_ingredients

  validates :name, presence: true, length: { minimum: 2}
end
