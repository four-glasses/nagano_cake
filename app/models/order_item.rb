class Order_item < ApplicationRecord
  belongs_to :item
  belongs_to :order_item
end
