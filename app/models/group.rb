class Group < ApplicationRecord
  belongs_to :tournament
  has_many :teams
  has_many :matches
end
