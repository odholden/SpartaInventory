class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.text :given_to
      t.integer :returner_id
      t.date :date_taken
      t.date :date_returned
      t.text :notes

      t.timestamps
    end
  end
end
