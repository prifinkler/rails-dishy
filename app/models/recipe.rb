class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_cuisines, dependent: :destroy
  has_many :cuisines, through: :recipe_cuisines

  has_many :recipe_dietaries, dependent: :destroy
  has_many :dietaries, through: :recipe_dietaries

  include PgSearch::Model
  pg_search_scope :search_by_name_and_time, against: %i[name time], using: { tsearch: { prefix: true }}
  pg_search_scope :search_by_ingredients, associated_against: { ingredients: :name }, using: { tsearch: { prefix: true } }
  pg_search_scope :search_by_cuisines, associated_against: { cuisines: :name }, using: { tsearch: { prefix: true } }

  acts_as_favoritable

  validates :name, :instruction, :description, presence: true, length: { minimum: 2 }
  validates :time, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :photo_url, presence: true
end
