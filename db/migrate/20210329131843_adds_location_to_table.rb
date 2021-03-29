class AddsLocationToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :location, :string
  end
end
