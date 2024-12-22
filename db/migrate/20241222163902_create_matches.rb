class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.belongs_to :team_local, foreign_key: {to_table: :teams}
      t.belongs_to :team_visitant, foreign_key: {to_table: :teams}
      t.timestamps
    end
  end
end
