class Recipe < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_time,
  against: [ :name, :time],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  has_many :users, through: :favourites
  has_many :favourites
  has_many :users, through: :favourites

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_cuisines
  has_many :cuisines, through: :recipe_cuisines

  has_many :recipe_dietaries
  has_many :dietaries, through: :recipe_dietaries

  validates :name, :instruction, :description, presence: true, length: { minimum: 2 }
  validates :time, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :photo_url, presence: true
end
