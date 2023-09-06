class Cuisine < ApplicationRecord
  has_many :user_cuisines
  has_many :users, through: :user_cuisines
  has_many :recipes, through: :recipe_cuisines

  validates :name, presence: true, length: { minimum: 2}
end
