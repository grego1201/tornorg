class Player < ApplicationRecord
  GENDER = [ "male", "female" ]

  has_and_belongs_to_many :teams
end
