class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
  
  def create
    @order = Order.create(order_params)
    ShoppingAddress.create(shopping_addresses_params)
    redirect_to root_path
  end

  private
  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shopping_addresses_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(order_id: @order.id)
  end
end
