Trestle.resource(:groups) do
  menu do
    item :groups, icon: "fa fa-star"
  end

  table do
    column :id
    column :tournament
    actions do |toolbar, instance, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
      toolbar.link "Generate matches", instance, action: :generate_matches,
        method: :post, style: :primary, icon: "fa fa-check",
        confirm: "Are you sure?"
    end
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

  controller do
    def generate_matches
      group = admin.find_instance(params)
      CreateGroupMatches.create_matches(group)
      flash[:message] = "Matches created for group #{group.id}"

      redirect_to admin.path(:index)
    end
  end

  routes do
    post :generate_matches, on: :member
  end
end
