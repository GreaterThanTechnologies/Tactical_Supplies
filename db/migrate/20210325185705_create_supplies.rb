class CreateSupplies < ActiveRecord::Migration[6.1]
  def change
    create_table :supplies do |t|
      t.string :unit 
      t.integer :quantity
      t.integer :item_id
      t.integer :owner_id
        
       

      t.timestamps
    end
  end
end
