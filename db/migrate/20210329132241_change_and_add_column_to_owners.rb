class ChangeAndAddColumnToOwners < ActiveRecord::Migration[6.1]
  def change
    rename_column :owners, :name, :fname
    add_column :owners, :lname, :string
  end
end
