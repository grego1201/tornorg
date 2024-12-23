class Tournament < ApplicationRecord
  GENDER = [ "male", "female", "mixed" ]

  validates :name, :date, presence: true
  has_many :teams
  has_many :groups

  def name_with_date
    "#{self.name} | #{self.date}"
  end
end
