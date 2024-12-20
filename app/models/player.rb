class Player < ApplicationRecord
  GENDER = [ "male", "female" ]

  has_and_belongs_to_many :teams
  has_many :tournaments, through: :teams

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
