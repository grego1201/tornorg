class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
