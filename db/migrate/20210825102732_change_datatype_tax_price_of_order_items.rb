class ChangeDatatypeTaxPriceOfOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :tax_price, :integer
  end
end
