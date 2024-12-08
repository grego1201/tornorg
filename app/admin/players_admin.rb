Trestle.resource(:players) do
  menu do
    item :players, icon: "fa fa-star"
  end

   # Customize the table columns shown on the index view.
   #
   # table do
   #   column :name
   #   column :created_at, align: :center
   #   actions
   # end

   form do |player|
     text_field :first_name
     text_field :last_name
     date_field :birthday
     select :gender, Player::GENDER.map { |gender| [ gender.capitalize, gender ] }

     row do
       col { datetime_field :updated_at }
       col { datetime_field :created_at }
     end
   end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:player).permit(:name, ...)
  # end
end
