require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'ユーザー新規登録ができる時' do

      it 'すべての項目が正しい時保存できる' do
        expect(@item).to be_valid
      end

    end


    context 'ユーザー新規登録ができない時' do

      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
  
      it '画像名が必須であること' do
        @item.iname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
  
      it '説明文が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it '料金が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it '料金は300以上999999以下でないと登録出来ないこと' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end

      it '料金は半角数字でないと登録出来ないこと' do
        @item.price = '２０'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end

      it 'カテゴリーのidが２以上でないと登録出来ないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it '発送までの日数のidが2以上でないと登録出来ないこと' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end

      it '発送料のidが２以上でないと登録出来ないこと' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it '発送元の地域のidが２以上でないと登録出来ないこと' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end

      it '商品の状態のidが２以上でないと登録出来ないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end


      it '全角文字では登録できないこと' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end

      it '半角英数混合では登録できないこと' do
        @item.price = '23３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end

      it '半角英語だけでは登録できないこと' do
        @item.price = 'goyahuenn'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end

      it '料金が上限を超えていたら登録できないこと' do
        @item.price = 9999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を適切に入力してください")
      end



    end

  

  end
end
