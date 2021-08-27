class Customer < ApplicationRecord
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many :deliveries
  has_many :cart_items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
