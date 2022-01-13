class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  #以下：アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :shipping_charges

  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :item_description, presence: true
  #以下：アクティブハッシュのバリデーション（{ id: 1, name: '--' }以外のときに保存できる）
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :ship_date_id, numericality: { other_than: 1 , message: "can't be blank"} 

  #金額は、¥300~¥9,999,999の半角数値のみ保存可能であることをバリデーション
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' } do
    validates :price, numericality:{only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:9999999, message: 'は300〜9999999の間で金額を入力してください'}
  end
end