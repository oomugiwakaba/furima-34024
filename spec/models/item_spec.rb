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
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  
      it '画像名が必須であること' do
        @item.iname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Iname can't be blank")
      end
  
      it '説明文が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '料金が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '料金は300以上999999以下でないと登録出来ないこと' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it '料金は半角数字でないと登録出来ないこと' do
        @item.price = "２０"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'カテゴリーのidが２以上でないと登録出来ないこと' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '発送までの日数のidが2以上でないと登録出来ないこと' do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it '発送料のidが２以上でないと登録出来ないこと' do
        @item.delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it '発送元の地域のidが２以上でないと登録出来ないこと' do
        @item.prefectures_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it '商品の状態のidが２以上でないと登録出来ないこと' do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end


    end

  

  end
end
