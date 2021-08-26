class AddCustomerIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :customer_id, :integer
    add_column :cart_items, :item_id    , :integer

    change_column_null :cart_items, :customer_id, false
    change_column_null :cart_items, :item_id    , false
  end
end
