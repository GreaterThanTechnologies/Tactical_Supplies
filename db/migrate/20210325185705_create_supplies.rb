class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|

      t.timestamps
    end
  end
end
