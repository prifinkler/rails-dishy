class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :recipes, through: :favourites
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :user_cuisines
  has_many :cuisines, through: :user_cuisines
  has_many :user_dietaries
  has_many :dietaries, through: :user_dietaries

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
end
