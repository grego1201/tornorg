class Group < ApplicationRecord
  belongs_to :tournament
  has_many :teams
  has_many :matches

  after_save :create_group_matches

  private

  def create_group_matches
    CreateGroupMatches.create_matches(self)
  end
end
