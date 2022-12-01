require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入者情報の保存' do
   before do
     @order_form = FactoryBot.build(:order_form)
     sleep(0.1)
    end

    context '内容に問題ない' do
      it "全ての項目が入力されていれば購入できる" do
       expect(@order_form).to be_valid
      end
      it "建物名がなくても購入できる" do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題あり' do
      it 'tokenが空では購入出来ないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空では購入出来ないこと' do
        @order_form.portal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Portal code can't be blank"
      end
      it '郵便番号にハイフンがないと購入出来ないこと' do
        @order_form.portal_code = '12345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Portal code is invalid"
      end
      it '郵便番号が8桁でないと購入出来ないこと' do
        @order_form.portal_code = '123-458'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Portal code is the wrong length (should be 8 characters)"
      end
      it 'prefecture_idが1以外でないと購入出来ない' do
        @order_form.prefecture_id = 1
        @oreder_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では購入出来ないこと' do
        @order_form.city = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      it 'addressesが空では購入出来ないこと' do
        @order_form.addresses = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Addresses can't be blank"
      end
      it 'phone_numberが空では購入出来ないこと' do
        @order_form.phone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが11桁ではないと購入出来ないこと' do
        @order_form.phone_number = "090123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include  "Phone number is too long (maximum is 11 characters)"
      end
      it 'user_idが空では購入出来ない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では購入出来ない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end