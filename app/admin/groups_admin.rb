Trestle.resource(:groups) do
  menu do
    item :groups, icon: "fa fa-star"
  end

  form do |group|
    collection_select :tournament_id, Tournament.all, :id, :name_with_date
    collection_select :team_ids, group.tournament&.teams || [], :id, :last_names,
      include_blank: false,
      include_hidden: false,
      multiple: true

    row do
      col { static_field :updated_at }
      col { static_field :created_at }
    end
  end

  params do |params|
    params.require(:group).permit(:tournament_id, "team_ids" => [])
  end
end
