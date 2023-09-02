class Recipe < ApplicationRecord
  has_many :users, through: :favourites
  has_many :ingredients, through: :ingredients_recipes
  has_many :cuisines, through: :cuisines_recipes
  has_many :dietaries, through: :dietaries_recipes

  validates :name, :portion, presence: true, length: { minimum: 2 }
  validates :time, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 1 }

  # def self.filter_by_cuisine(cuisine_ids)
  #   where(cuisine_id: cuisine_ids)
  # end

  # def self.filter_by_ingredients(ingredient_ids)
  #   joins(:ingredients).where(ingredients: { id: ingredient_ids })
  # end

  # def self.filter_by_dietary(dietary_ids)
  #   #   where(dietary_id: dietary_ids)
  #   # end

end
