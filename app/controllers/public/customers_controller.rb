class CustomersController < ApplicationController

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
    
    unless @customer.id  == current_customer.id
      flash[:error] = "認証に失敗しました"
      redirect_to root_path
    end
  end

  def update
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

end
