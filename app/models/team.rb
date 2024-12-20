class Team < ApplicationRecord
  has_and_belongs_to_many :players
  belongs_to :tournament

  validates :players, length: { is: 2 }

  def last_names
    self.players.map(&:last_name).join(" - ")
  end
end
