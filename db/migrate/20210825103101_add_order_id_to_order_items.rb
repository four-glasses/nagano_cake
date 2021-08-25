class AddOrderIdToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items,         :order_id, :integer

    change_column_null :order_items, :order_id, false
  end
end
