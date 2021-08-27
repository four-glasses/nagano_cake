class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  def total
    
  end
  
  def update
    order = Order.find(params[:id])
    order_items = order.order_items
    order.update(order_params)
    
    if order.order_status == "入金確認"
       order_items.update_all(production_status:"制作待ち")
    end
    redirect_to admins_order_path(order.i)
    
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:order_status)
    
  end
  
end
