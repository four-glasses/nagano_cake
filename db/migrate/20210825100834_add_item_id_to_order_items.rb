class AddItemIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :item_id, :integer

    change_column_null :order_items, :item_id,           false
    change_column_null :order_items, :amount,            false
    change_column_null :order_items, :production_status, false
    change_column_null :order_items, :tax_price,         false
  end
end
