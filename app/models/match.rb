class Match < ApplicationRecord
  belongs_to :team_local, class_name: "Team"
  belongs_to :team_visitant, class_name: "Team"
  belongs_to :group

  validates :team_local, :team_visitant, :group, presence: true
end
