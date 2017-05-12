class ChangeLenderIdToString < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :logs, :users
    change_column :logs, :lender_id, :string
  end
end
