class ChangeUserIdToLenderId < ActiveRecord::Migration[5.0]
  def change
    rename_column :logs, :user_id, :lender_id
  end
end
