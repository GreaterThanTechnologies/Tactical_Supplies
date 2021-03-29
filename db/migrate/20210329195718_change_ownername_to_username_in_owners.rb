class ChangeOwnernameToUsernameInOwners < ActiveRecord::Migration[6.1]
  def change
    rename_column :owners, :ownername, :username
  end
end
