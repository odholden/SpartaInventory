class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :item_model
      t.string :item_serial_number

      t.timestamps
    end
  end
end
