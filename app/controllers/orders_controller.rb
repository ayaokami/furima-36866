class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shopping_address = OrderShoppingAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_shopping_address = OrderShoppingAddress.new(order_params)
    binding.pry
    if @order_shopping_address.valid?
      @order_shopping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shopping_address).permit(:item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end
end
