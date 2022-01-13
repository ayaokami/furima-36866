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

  #以下：アクティブハッシュのバリデーション（{ id: 1, name: '--' }以外のときに保存できる）
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :ship_date_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"} 
end