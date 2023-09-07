class Dietary < ApplicationRecord
  has_many :user_dietaries
  has_many :recipe_dietaries

  has_many :users, through: :user_dietaries
  has_many :recipes, through: :recipe_dietaries
  validates :dietary_type, presence: true, length: { minimum: 2 }
end
