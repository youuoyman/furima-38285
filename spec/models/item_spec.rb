require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規出品登録' do 
   context '新規出品登録ができるとき'do
   it '項目が全て埋まったとき' do
     expect(@item).to be_valid
   end
  end
    context '新規出品登録出来ないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録出来ない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_infoが空では登録出来ない' do
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'item_categoryが1以外でないと登録出来ない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end
      it 'statusが1以外でないと登録出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'shipping_feeが1以外でないと登録出来ない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'prefectureが1以外でないと登録出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'deliveryが1以外でないと登録出来ない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it 'item_priceが空では登録出来ない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceが300未満だと登録出来ない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is out of setting range"
      end
      it 'item_priceが10000000以上だと登録出来ない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is out of setting range"
      end
      it 'item_priceが全角数字だと登録出来ない' do
        @item.item_price = "00000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is out of setting range"
      end
      it 'item_priceが半角英字だと登録出来ない' do
        @item.item_price = "sample"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price Half-width number"
      end
      it 'item_priceが半角英数字混合では登録出来ない' do
        @item.item_price = "sample00000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price Half-width number"
      end
      it 'userが紐ついていないと登録出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end


