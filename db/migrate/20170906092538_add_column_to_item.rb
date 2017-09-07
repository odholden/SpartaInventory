class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :academy_id, :integer
  end
end
