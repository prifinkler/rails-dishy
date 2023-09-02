class Cuisine < ApplicationRecord
  has many :users, through: :user_cuisines
  has many :recipes, through: :recipe_cuisines

  validates :name, presence: true, length: { minimum: 2}
end
