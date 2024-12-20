class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end