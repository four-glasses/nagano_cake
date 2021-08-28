class Public::OrdersController < ApplicationController

def index
  @orders = current_customer.orders.all
end

def comfirm
@order = Order.new
@order.address = params[:add]
@order.postal_code = params[:postal_code]
@order.name = params[:name]
@order.pay_status = params[:receive_pay].to_i
@cart_items = current_customer.cart_items
if params[:address_select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
elsif params[:address_select] == "1"
      @address = Delivery.find_by(address:params[:address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
elsif params[:address_select] == "2"
      @address = current_customer.deliveries.new
      @address.postal_code = @order.postal_code
      @address.address = @order.address
      @address.name = @order.name
      @address.save
end
end

def complete
end

def create

@order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items.all
    if  @order.save
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.tax_price = cart_item.item.non_taxed_price
          @order_items.amount = cart_item.amount
          @order_items.production_status = cart_item.production_status
          @order_items.save
        end
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    else
      @address = current_customer.addresses.all
      render :new
    end

end

def show
  @order = Order.find(params[:id])
	unless current_customer.nil? || current_customer.id == @order.customer_id
    flash[:warning] = "アクセス権がありません"
	  redirect_to orders_path(id: current_customer.id)
	end
end

def new
	@customer = current_customer
	# if @customer.cart_items.blank?
 #  	flash[:warning] = "カートが空です"
 # 	redirect_to cart_items_path
	# else
 # 	@order = Order.new(customer_id: @customer.id)
  	@ads = @customer.address
  	# @address = Deliveries.new(customer_id: @customer.id)
	# end
end
private

def order_params
 params.require(:order).permit(:customer_id, :payment, :address, :postal_code, :last_name, :first_name, :last_name_kana, :first_name_kana,)
end

end
