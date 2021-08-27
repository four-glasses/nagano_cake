class Public::CartItemsController < ApplicationController

include PublicItemsHelper

def index
 @cart_items = current_customer.cart_items

end

def update
  @items = current_user.cart_items

  @items.each do |item|
        item.amount = params[:amount][item.id.to_s].to_i
        item.tax_price = item.amount * item.items.price
        item.save
        flash[:success] =  "更新に成功しました"
  end
        flash[:warning] = "入力内容を確認してください"
        redirect_to cart_items_path

end


def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to cart_items_path
end

def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path

end

def create
    @cart_item = CartItem.new(item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
end

 private
    def item_params
      params.require(:cart_item).permit(:customer_id, :items_id, :amount, :tax_price)
    end

end
