class AddColumnToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :due_date, :date
  end
end
