class Item < ApplicationRecord
  attachment :image
  validates :name, {presence: true}
  validates :items_explanation, {presence: true}
  validates :non_taxed_price, {presence: true}
end
