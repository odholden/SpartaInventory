class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :given_to
      t.integer :returner_id
      t.date :date_taken
      t.date :date_returned

      t.timestamps
    end
  end
end
