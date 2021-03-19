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

      it 'すべての項目が正しい時保存できる' do
        expect(@user).to be_valid
      end
      

    end


    context 'ユーザー新規登録ができない時' do

      it 'ニックネームが必須であること' do
        @user.uname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
  
      it 'emailが一意性でないと登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
  
      it 'emailに@がないと登録できないこと' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
  
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = 'asdfghj'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角文字を入力してください")
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'あsdfghっjk'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角文字を入力してください")
      end

      it 'passwordが5文字以下では登録できないこと' do
        @user.password = 'gf345'
        @user.password_confirmation = 'gf345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
  
      it 'passwordと確認用passwordが一致しないと登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角文字を入力してください")
      end

      it 'seiが空では登録できないこと' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)を入力してください")
      end

      it 'meiが空では登録できないこと' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)を入力してください")
      end

      it 'seiは、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.sei = 'oota'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)は全角文字を入力してください")
      end

      it 'meiは、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.mei = 'yosio'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)は全角文字を入力してください")
      end

      it 'sei_huriが空では登録できないこと' do
        @user.sei_huri = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください")
      end

      it 'mei_huriが空では登録できないこと' do
        @user.mei_huri = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カタカナ)を入力してください")
      end

      it 'sei_huriは、全角（カタカナ）でないと登録できないこと' do
        @user.sei_huri = 'oota'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カタカナ)はカタカナを入力してください")
      end

      it 'mei_huriは、全角（カタカナ）でないと登録できないこと' do
        @user.mei_huri = 'yosio'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カタカナ)はカタカナを入力してください")
      end

      it 'sei_huriは、カタカナ以外の全角文字だと登録できないこと' do
        @user.sei_huri = '大田'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カタカナ)はカタカナを入力してください")
      end

      it 'mei_huriは、カタカナ以外の全角文字だと登録できないこと' do
        @user.mei_huri = '義夫'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カタカナ)はカタカナを入力してください")
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end







    end



  end
end
