class AddLoanToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :loan, :boolean, default: true
  end
end

# https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role
