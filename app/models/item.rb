class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre
  attachment :image
  validates :name, {presence: true}
  validates :items_explanation, {presence: true}
  validates :non_taxed_price, {presence: true}
end
