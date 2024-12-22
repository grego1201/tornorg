class Team < ApplicationRecord
  has_many :local_matches, class_name: "Match", foreign_key: "team_local_id"
  has_many :visitant_matches, class_name: "Match", foreign_key: "team_visitant_id"
  has_and_belongs_to_many :players
  belongs_to :tournament
  belongs_to :group, optional: true

  validates :players, length: { is: 2 }

  def matches
    Match.where("team_local_id = ? OR team_visitant_id = ?", self.id, self.id)
  end

  def last_names
    self.players.map(&:last_name).join(" - ")
  end
end
