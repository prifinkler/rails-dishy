class Recipe < ApplicationRecord
  has_many :users, through: :favourites
  has_many :ingredients, through: :ingredients_recipes
  has_many :cuisines, through: :cuisines_recipes
  has_many :dietaries, through: :dietaries_recipes

  validates :name, :portion, presence: true, length: { minimum: 2 }
  validates :time, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 1 }
end
