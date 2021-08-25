class AddCustomerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column         :orders, :customer_id, :integer

    change_column_null :orders, :customer_id, false
  end
end
