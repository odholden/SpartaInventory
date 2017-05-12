class ChangeLogFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :logs, :given_to, :borrower_id
    rename_column :logs, :returner_id, :returned_to_id
    rename_column :logs, :date_returned, :return_date
    remove_column :logs, :date_taken, :date
  end
end
