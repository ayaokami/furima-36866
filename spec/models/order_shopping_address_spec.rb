require 'rails_helper'

RSpec.describe OrderShoppingAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shopping_address = FactoryBot.build(:order_shopping_address, user_id: user.id, item_id: item.id)
      #order_shopping_addressはモデルでなくクラスなのでfactories/order_shopping_address.rb内でアソシエーションが組めない。
      #そのため、ここでuserとitemを生成し、上記紐付けを行う
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
      end
      it 'postcodeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
      end
      it 'prefecture_idを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'blockが空では保存できないこと' do
      end
      it 'phone_numberが空では保存できないこと' do
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でないと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
      it 'itemが紐付いていないと保存できないこと' do
      end
    end
  end
end
