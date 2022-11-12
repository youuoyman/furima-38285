require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'ユーザー情報と本人情報があれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = '123456'
       @user.password_confirmation = '1234567'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it 'emailは@を含まないと登録できない' do
       @user.email = 'testmail'
       @user.valid?
       expect(@user.errors.full_messages).to include 'Email is invalid'
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = '00000'
       @user.password_confirmation = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
     end
     it 'passwordが129文字以上では登録できない' do
       @user.password = Faker::Internet.password(min_length: 129)
       @user.password_confirmation = @user.password
       @user.valid?
       expect(@user.errors.full_messages).to include 'Password is too long (maximum is 128 characters)'
     end
     it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
     end
     it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end
     it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end
     it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end
     it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
    end
  end
end
