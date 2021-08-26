
class Public::DeliveriesController < ApplicationController
 def index
  	@shipping_addresses = current_customer.deliveries
  	@shipping_address = Delivery.new
 end

	def create
	  @shipping_address = Delivery.new(shipping_address_params)
	  @shipping_address.customer_id = current_customer.id
  if @shipping_address.save!
	  	 flash.now[:notice] = "新規配送先を登録しました"
	   redirect_to deliveries_path
	   #else
	  #	 @shipping_addresses = current_customer.shipping_address
	  #    render 'index'
  end
	end

	def edit
    @shipping_address = Delivery.find(params[:id])
	end

	def update
	  @shipping_address = Delivery.find(params[:id])
	  if @shipping_address.update(shipping_address_params)
  	 flash[:success] = "配送先を変更しました"
     redirect_to deliveries_path
	  else
	   render "edit"
	  end
	end

	def destroy
	  @shipping_address = Delivery.find(params[:id])
	  @shipping_address.destroy
    flash.now[:alert] = "配送先を削除しました"
	  redirect_to deliveries_path
	end

	private

def shipping_address_params
  params.require(:delivery).permit(:postal_code, :address, :name)
end

end
