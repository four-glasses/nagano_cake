class Public::OrdersController < ApplicationController


before_action :params_check, only: [:index]

def index
  @customer = Customer.find(params[:id])
  @orders = @customers.orders
  unless current_customer.nil? || current_customer.id == @customers.id
    flash[:warning] = "アクセス権がありません"
    redirect_to orders_path(id: current_customer.id)
  end
end

def comfirm
@order = Order.find(params[:id])
	# 他のuserのアクセス阻止
		unless current_customer.nil? || current_customer.id == @order.customer_id
    		flash[:warning] = "アクセス権がありません"
			redirect_to orders_path(id: current_customer.id)
		end
		@items = @order.ordered_items

end

def complete
  cart_items = current_customer.cart_items
  cart_items.destroy_all
end

def create
@order = Order.new(order_params)
		@customers = current_customer
		@ads = @customers.addresses
			if params[:_add] == "usersAdd"
				@order.address = @customers.address
				@order.last_name = @customers.last_name
				@order.first_name = @customers.first_name
				@order.last_name_kana = @customers.last_name_kana
				@order.first_name_kana = @customers.first_name_kana
				@order.postal_code = @customers.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:Address][:id])
				@order.address = @ad.address
				@order.last_name = @ad.last_name
				@order.first_name = @ad.first_name
				@order.last_name_kana = @ad.last_name_kana
				@order.first_name_kana = @ad.first_name_kana
				@order.ship_postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
				@ad = ShipToAddress.new
				@ad.customer_id = @customer.id
				@ad.address = params[:ship_to_address][:address]
				@ad.last_name = params[:ship_to_address][:last_name]
				@ad.first_name = params[:ship_to_address][:first_name]
				@ad.last_name_kana = params[:ship_to_address][:last_name_kana]
				@ad.first_name_kana = params[:ship_to_address][:first_name_kana]
				@ad.postal_code = params[:ship_to_address][:postal_code]
				@ad.phone = params[:ship_to_address][:phone]
				@ad.save

				@order.ship_address = params[:ship_to_address][:address]
				@order.last_name = params[:ship_to_address][:last_name]
				@order.first_name = params[:ship_to_address][:first_name]
				@order.last_name_kana = params[:ship_to_address][:last_name_kana]
				@order.first_name_kana = params[:ship_to_address][:first_name_kana]
				@order.ship_postal_code = params[:ship_to_address][:postal_code]
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
	if @customer.cart_items.blank?
   	flash[:warning] = "カートが空です"
  	redirect_to cart_items_path
	else
  	@order = Order.new(customer_id: @customer.id)
  	@ads = @customer.addresses
  	@address = ShipToAddress.new(customer_id: @customer.id)
	end

end
end
