class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  attachment :image
  validates :name, {presence: true}
  validates :items_explanation, {presence: true}
  validates :non_taxed_price, {presence: true}
end
