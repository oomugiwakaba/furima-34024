require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address, item_id: item.id, user_id: user.id)
      sleep 1
    end



    context '商品購入ができる時' do

      it 'すべての項目が正しくtokenもある時保存できる' do
        expect(@buy_address).to be_valid
      end
    
      it 'ビル名は空でも保存できる' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end

    end


    context '商品購入ができない時' do

      it '郵便番号が空では登録できないこと' do
        @buy_address.postal = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal can't be blank")
      end
      
      it '都道府県のidが1では登録できないこと' do
        @buy_address.prefectures_id = '1'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it '市区町村が空では登録できないこと' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では登録できないこと' do
        @buy_address.adress = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Adress can't be blank")
      end

      it '電話番号が空では登録できないこと' do
        @buy_address.phone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '郵便番号にハイフンがなければ登録できないこと' do
        @buy_address.postal = '1231234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end

      it '電話番号が11桁より大きければ登録できないこと' do
        @buy_address.phone = '123123456789123'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end



      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end


      it "item_idが空では登録できないこと" do
        @buy_address.item_id = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @buy_address.user_id = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end



      
    end



  end
end
