class RemoveUnusedFromLogsAddReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :logs, :item_id, :integer
    add_reference :logs, :item, foreign_key: true

    remove_column :items, :item_serial_number, :string
    remove_column :items, :loan, :boolean

    drop_table :users
  end
end
