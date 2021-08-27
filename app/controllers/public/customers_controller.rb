class Public::CustomersController < ApplicationController

  # ログインユーザー（カスタマー）に権限を限定
  before_action :authenticate_customer!

  # カスタマーのマイページ
  def show
    @customer = current_customer
    # ログインしてても他者のページには入れない
    unless @customer.id  == current_customer.id
      flash[:error] = "認証に失敗しました"
      redirect_to root_path
    end
  end

  def edit
    @customer = current_customer
    unless @customer.id  == current_customer.id
      flash[:error] = "認証に失敗しました"
      redirect_to root_path
    end
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render edit_customers_path
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "#{@customer.first_name}さん、今までご利用いただきありがとうございました！"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit( :last_name, :last_name_kana, :first_name, :first_name_kana, :email, :telephone, :postal_code, :address)
  end

end
