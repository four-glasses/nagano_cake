class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def after_sign_in_path_for(resource)
      if customer_signed_in?
        customers_path(resource)
      else
        admin_top_path
      end
    end

    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :kana_first_name, :kana_last_name,
                :email, :postal_code, :residence, :phone_number])

  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])

    end

  private


  def set_product
    @product = Product.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
