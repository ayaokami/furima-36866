class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]
  before_action :no_transition, only: [:index,:create]

  def index
    @order_shopping_address = OrderShoppingAddress.new
  end
  
  def create
    @order_shopping_address = OrderShoppingAddress.new(order_params)
    if @order_shopping_address.valid?
      pay_item
      @order_shopping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shopping_address).permit( :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,          # 商品の値段
      card: order_params[:token],   # カードトークン
      currency: 'jpy'               # 通貨の種類（日本円）
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  #ログインした出品者は自分の出した商品の購入ページに移動しようとするとトップページへ移動する/売却済みの商品購入ページに遷移するとトップページへ戻る
  def no_transition
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end
end
