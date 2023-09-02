class Dietary < ApplicationRecord
  has many :users, :through :user_dietaries
  has many :recipes, through: :recipe_dietaries
  validates :dietary_type, presence: true, length: { minimum: 2}
end
