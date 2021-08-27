class Public::OrdersController < ApplicationController

def index
  @customer = current_customer
  @orders = @customer.orders
  unless current_customer.nil? || current_customer.id == @customer.id
    flash[:warning] = "アクセス権がありません"
    redirect_to orders_path(id: current_customer.id)
  end
end

def comfirm
@order = Order.find(params[:id])
		unless current_customer.nil? || current_customer.id == @order.customer_id
    		flash[:warning] = "アクセス権がありません"
			redirect_to orders_path(id: current_customer.id)
		end
		@items = @order.ordered_items

end

def complete
end

def create
@order = Order.new(order_params)
		@customer = current_customer
		@ads = @customer.addresses
			if params[:_add] == "usersAdd"
				@order.address = @customer.address
				@order.last_name = @customer.last_name
				@order.first_name = @customer.first_name
				@order.last_name_kana = @customer.last_name_kana
				@order.first_name_kana = @customer.first_name_kana
				@order.postal_code = @customer.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:Address][:id])
				@order.address = @ad.address
				@order.last_name = @ad.last_name
				@order.first_name = @ad.first_name
				@order.last_name_kana = @ad.last_name_kana
				@order.first_name_kana = @ad.first_name_kana
				@order.postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
				@ad = Deliveries.new
				@ad.customer_id = @customer.id
				@ad.address = params[:deliveries][:address]
				@ad.last_name = params[:deliveries][:last_name]
				@ad.first_name = params[:deliveries][:first_name]
				@ad.last_name_kana = params[:deliveries][:last_name_kana]
				@ad.first_name_kana = params[:deliveries][:first_name_kana]
				@ad.postal_code = params[:deliveries][:postal_code]
				@ad.phone = params[:deliveries][:phone]
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
