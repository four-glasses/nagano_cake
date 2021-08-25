class AddCustomerIdToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :customer_id, :integer

    change_column_null :deliveries, :customer_id, false
  end
end
