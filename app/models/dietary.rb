class Dietary < ApplicationRecord
  has many :users, :through :dietaries_users
  has many :recipes, through: :dietaries_recipes
  validates :dietary_type, presence: true, length: { minimum: 2}
end
