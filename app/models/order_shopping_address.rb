class OrderShoppingAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postcode,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)あり、半角数字で郵便番号を入力してください"}
    validates :prefecture_id,  numericality: {other_than: 1, message: "都道府県を選んでください"}
    validates :city
    validates :block
    validates :phone_number,  format: {with: /\A[0-9]{10,11}\z/, message: "ハイフン(-)なし、半角数字で電話番号を入力してください"}
    validates :item_id
    validates :user_id
  end
end