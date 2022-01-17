require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'すべての項目が正しく入力できれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1だと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_charges_idが1だと出品できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'ship_date_idが1だと出品できない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299未満では出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の間で半角数字を入力してください')
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の間で半角数字を入力してください')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の間で半角数字を入力してください')
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
