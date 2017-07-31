class AddSerialToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :serial, :text
  end
end
