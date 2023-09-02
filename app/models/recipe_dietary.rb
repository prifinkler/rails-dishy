class RecipeDietary < ApplicationRecord
  belongs_to :recipe
  belongs_to :dietary
end
