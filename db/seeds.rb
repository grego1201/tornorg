# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



def create_players
  50.times do |index|
    Player.create(
      first_name: Faker::Name.first_name,
      last_name: "#{index} #{Faker::Name.last_name}",
      birthday: Faker::Date.birthday,
      gender: Player::GENDER.sample
    )
  end
end

def create_tournaments
  10.times do |index|
    Tournament.create(
      name: Faker::Lorem.sentence,
      date: Faker::Date.backward,
      gender: Tournament::GENDER.sample
    )
  end
end

def create_teams_and_groups
  Tournament.all.each do |tournament|
    Player.all.in_groups_of(2).each do |players|
      Team.create(tournament: tournament, player_ids: players.map(&:id))
    end

    tournament.team_ids.in_groups_of(4, false).each do |team_ids|
      Group.create(tournament: tournament, team_ids: team_ids)
    end
  end
end

create_players
create_tournaments
create_teams_and_groups
