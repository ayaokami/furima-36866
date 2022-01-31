class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id && item.order.blank?
      item.destroy
      redirect_to root_path
    end
  end

  def edit
    # ログイン状態の場合でも、自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
    if user_signed_in? && @item.order.present?
      redirect_to root_path
    end
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :condition_id, :shipping_charges_id,
                                 :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
