class ChangeReturnToIdToString < ActiveRecord::Migration[5.0]
  def change
    change_column :logs, :returned_to_id, :string
  end
end
