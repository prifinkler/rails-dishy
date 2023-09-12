class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favourites, dependent: :destroy
  has_many :recipes, through: :favourites, source: :recipe

  has_many :user_cuisines, dependent: :destroy
  has_many :cuisines, through: :user_cuisines

  has_many :user_dietaries, dependent: :destroy
  has_many :dietaries, through: :user_dietaries

  has_many :user_ingredients, dependent: :destroy
  has_many :ingredients, through: :user_ingredients

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
end
