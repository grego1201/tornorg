class AddGroupToMatch < ActiveRecord::Migration[8.0]
  def change
    change_table :matches do |t|
      t.belongs_to :group
    end
  end
end
