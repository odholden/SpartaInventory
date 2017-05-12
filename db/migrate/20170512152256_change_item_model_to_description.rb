class ChangeItemModelToDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :item_model, :description
  end
end
