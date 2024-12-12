class AddTournamentToTeam < ActiveRecord::Migration[8.0]
  def change
    change_table :teams do |t|
      t.belongs_to :tournament
    end
  end
end
