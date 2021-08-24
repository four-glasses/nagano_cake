class Admins::OrdersController < ApplicationController
  # before actionは後ほど追記
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def total
    
  end
  
  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(order_params)
    
    if order.order_status == "入金確認"
       order_details.update_all(production_status:"制作待ち")
    end
    redirect_to admins_order_path(order.i)
    
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:order_status)
    
  end
  
end
