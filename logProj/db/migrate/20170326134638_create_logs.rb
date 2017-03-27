class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :given_to
      t.date :date_taken
      t.integer :returned_by
      t.date :date_returned
      t.text :checked

      t.timestamps
    end
  end
end
