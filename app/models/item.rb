class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # 以下：アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :shipping_charges

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
  end
  # 以下：アクティブハッシュのバリデーション（{ id: 1, name: '--' }以外のときに保存できる）
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :ship_date_id
  end

  # 金額は、¥300~¥9,999,999の半角数値のみ保存可能であることをバリデーション
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'は300〜9999999の間で半角数字を入力してください' }
end
