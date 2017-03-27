class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_email
      t.integer :given_to_user_id

      t.timestamps
    end
  end
end
