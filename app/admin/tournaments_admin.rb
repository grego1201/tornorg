Trestle.resource(:tournaments) do
  menu do
    item :tournaments, icon: "fa fa-star"
  end

  table do
    column :id
    column :name
    column :date
    column :gender
    actions do |toolbar, instance, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
      toolbar.link "Generate groups", instance, action: :generate_groups,
        method: :post, style: :primary, icon: "fa fa-check",
        confirm: "Are you sure?"
    end
  end

  form do |tournament|
    text_field :name
    date_field :date
    select :gender, Tournament::GENDER.map { |gender| [ gender.capitalize, gender ] }

    row do
      col { static_field :updated_at }
      col { static_field :created_at }
    end
  end

  controller do
    def generate_groups
      tournament = admin.find_instance(params)
      tournament.team_ids.in_groups_of(4, false).each do |team_ids|
        Group.create(tournament: tournament, team_ids: team_ids)
      end
      flash[:message] = "Groups created for touranament #{tournament.name}"
      redirect_to admin.path(:index)
    end
  end

  routes do
    post :generate_groups, on: :member
  end
end
