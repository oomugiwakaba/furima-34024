require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end


    context 'ユーザー新規登録ができる時' do

      it 'パスワードは、6文字以上での入力と半角英数字混合での入力で登録可能であること' do
        @user.password = '1asdfg'
        @user.password_confirmation = '1asdfg'
        expect(@user).to be_valid
      end



    end


    context 'ユーザー新規登録ができない時' do

      it 'ニックネームが必須であること' do
        @user.uname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Uname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'emailが一意性でないと登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'emailに@がないと登録できないこと' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordが5文字以下では登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'passwordと確認用passwordが一致しないと登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'seiが空では登録できないこと' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei can't be blank", "Sei is invalid. Input full-width characters.")
      end

      it 'meiが空では登録できないこと' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei can't be blank", "Mei is invalid. Input full-width characters.")
      end

      it 'seiは、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.sei = 'fdhr'
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei is invalid. Input full-width characters.")
      end

      it 'meiは、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.mei = 'hiydjt'
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei is invalid. Input full-width characters.")
      end

      it 'sei_huriが空では登録できないこと' do
        @user.sei_huri = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei huri can't be blank", "Sei huri is invalid. Input full-width katakana characters.")
      end

      it 'mei_huriが空では登録できないこと' do
        @user.mei_huri = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei huri can't be blank", "Mei huri is invalid. Input full-width katakana characters.")
      end

      it 'sei_huriは、全角（カタカナ）でないと登録できないこと' do
        @user.sei_huri = 'ostw'
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei huri is invalid. Input full-width katakana characters.")
      end

      it 'mei_huriは、全角（カタカナ）でないと登録できないこと' do
        @user.mei_huri = 'hrshh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei huri is invalid. Input full-width katakana characters.")
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end







    end



  end
end
