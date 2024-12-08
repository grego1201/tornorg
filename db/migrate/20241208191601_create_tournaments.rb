class CreateTournaments < ActiveRecord::Migration[8.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date
      t.string :gender

      t.timestamps
    end
  end
end