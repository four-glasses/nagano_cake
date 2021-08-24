class Admins::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10) 
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create

    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
    redirect_to new_admins_item_path
    end

  end


  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admins_item_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :items_explanation, :non_taxed_price, :image_id, :sales_status)
  end

end
