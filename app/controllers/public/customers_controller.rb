class CustomersController < ApplicationController

  # ログインユーザー（カスタマー）に権限を限定
  before_action :authenticate_customer!

  # カスタマーのマイページ
  def show
    # ログインしてても他者のページには入れない
    unless current_customer.nil? || current_customer.id == customers.id
      flash[:error] = "認証に失敗しました"
      redirect_to "public/homes#top"
    end
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

end
