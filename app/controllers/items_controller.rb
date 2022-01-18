class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]

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
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :condition_id, :shipping_charges_id,
                                 :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
end
