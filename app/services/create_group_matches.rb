module CreateGroupMatches
  ORDER = [
    { local: 0, visitant: 1 },
    { local: 2, visitant: 0 },
    { local: 0, visitant: 3 },
    { local: 1, visitant: 2 },
    { local: 3, visitant: 1 },
    { local: 2, visitant: 3 }
  ]

  def self.create_matches(group)
    return if group.teams.count != 4

    teams = group.teams
    ORDER.each do |order|
      Match.create!(
        team_local_id: teams[order[:local]].id,
        team_visitant_id: teams[order[:visitant]].id,
        group_id: group.id
      )
    end
  end
end
