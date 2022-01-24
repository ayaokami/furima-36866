class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end
  
  def create
    binding.pry
    @order = Order.create(order_params)
    ShoppingAddress.create(shopping_addresses_params)
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: @item_id)
  end

  def shopping_addresses_params
    parame.rewuire(:shopping_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(order_id: @order.id)
  end
end
