Trestle.resource(:teams) do
  menu do
    item :teams, icon: "fa fa-star"
  end

  table do
    column :id
    column :players, header: "Players" do |team|
      team.players.map(&:last_name).join(" - ")
    end
    column :tournament, header: "Tournament" do |team|
      tournament = team.tournament
      admin_link_to(tournament.name_with_date, tournament)
    end
    column :created_at, align: :center
    column :updated_at, align: :center

    actions
  end

  form do |team|
    static_field :id
    collection_select :tournament_id, Tournament.all, :id, :name_with_date
    collection_select :player_ids, Player.all, :id, :full_name,
      include_blank: false,
      include_hidden: false,
      multiple: true

    row do
      col { static_field :updated_at }
      col { static_field :created_at }
    end
  end

  params do |params|
    params.require(:team).permit("tournament_id", "player_ids" => [])
  end
end
