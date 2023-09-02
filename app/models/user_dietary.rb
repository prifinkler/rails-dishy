class UserDietary < ApplicationRecord
  belongs_to :user
  belongs_to :dietary
end
