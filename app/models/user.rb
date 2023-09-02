class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :recipes, through: :favourites
  has_many :ingredients, through: :ingredients_users
  has_many :cuisines, through: :cuisines_users
  has_many :dietaries, through: :dietaries_users

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
end
