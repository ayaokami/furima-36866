class OrderShoppingAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id
end