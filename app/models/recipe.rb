class Recipe < ApplicationRecord
  has_many :users, through: :favourites
  has_many :ingredients, through: :recipe_ingredients
  has_many :cuisines, through: :recipe_cuisines
  has_many :dietaries, through: :recipe_dietaries

  validates :name, presence: true, length: { minimum: 2 }
  validates :time, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
