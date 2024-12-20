module GroupsHelper
  def teams_collection(tournament)
    return [] if tournament.nil?

    tournament.teams
  end
end
