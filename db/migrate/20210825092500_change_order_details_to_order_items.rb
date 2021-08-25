class ChangeOrderDetailsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_details, :order_items
  end
end
