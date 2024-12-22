class Match < ApplicationRecord
  belongs_to :team_local, class_name: 'Team'
  belongs_to :team_visitant, class_name: 'Team'
end
