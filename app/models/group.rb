class Group < ApplicationRecord
  belongs_to :tournament
  has_many :teams
end
