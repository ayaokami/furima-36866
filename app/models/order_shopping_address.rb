class OrderShoppingAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めて半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'はハイフン(-)なし、10桁以上11桁以内の半角数字で入力してください' }
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShoppingAddress.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                           phone_number: phone_number, order_id: order.id)
  end
end
