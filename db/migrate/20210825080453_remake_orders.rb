class RemakeOrders < ActiveRecord::Migration[5.2]
  def change
   create_table :orders do |t|
      t.integer :receive_status,default: 0,null: false
      t.integer :postage
      t.integer :billing
      t.string :address
      t.string :name
      t.integer :pay_status,default: 0,null: false
      t.integer :postal_code

      t.timestamps
    end
  end
end
