class Tournament < ApplicationRecord
  GENDER = [ "male", "female", "mixed" ]

  validates :name, :date, presence: true
end
