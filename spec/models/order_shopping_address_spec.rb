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
        expect(@order_shopping_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shopping_address.building = ''
        expect(@order_shopping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_shopping_address.postcode = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_shopping_address.postcode = '1234567'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Postcode ハイフン(-)あり、半角数字で郵便番号を入力してください")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_shopping_address.prefecture_id = '1'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Prefecture 都道府県を選んでください")
      end
      it 'cityが空だと保存できないこと' do
        @order_shopping_address.city = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できないこと' do
        @order_shopping_address.block = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_shopping_address.phone_number = ''
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満の半角数値では保存できないこと' do
        @order_shopping_address.phone_number = '111111111'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Phone number ハイフン(-)なし、10桁以上11桁以内の半角数字で電話番号を入力してください")
      end
      it 'phone_numberが11桁以上の半角数値では保存できないこと' do
        @order_shopping_address.phone_number = '222222222222'
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Phone number ハイフン(-)なし、10桁以上11桁以内の半角数字で電話番号を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shopping_address.user_id = nil
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shopping_address.item_id = nil
        @order_shopping_address.valid?
        expect(@order_shopping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
