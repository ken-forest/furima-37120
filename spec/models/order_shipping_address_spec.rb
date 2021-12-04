require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)

    sleep 0.1 # 0.1秒待機(RspecのMySQLエラーを防ぐため)
  end
  


  describe '商品の購入' do


    context '商品の購入ができる場合' do

      it 'postal_code、prefecture_id、city、address、phone_numberが正しく入力されていれば購入できる' do
        expect(@order_shipping_address).to be_valid
      end

    end


    context '商品の購入ができない場合' do

      it '郵便番号が空では購入できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号に記号のハイフンが無いと購入できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it '郵便番号が全角文字が入っいると購入できない' do
        @order_shipping_address.postal_code = 'あ'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号が全角数字だと購入できない' do
        @order_shipping_address.postal_code = '１２３-４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が選ばれていないと購入できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地情報が空では購入できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it '電話番号が全角数字では購入できない' do
        @order_shipping_address.phone_number = '０７４３６６３３３３'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が全角数字では購入できない' do
        @order_shipping_address.phone_number = '０７４３６６３３３３'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号に記号のハイフンがあれば購入できない' do
        @order_shipping_address.phone_number = '0743-66-3333'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号に文字があれば購入できない' do
        @order_shipping_address.phone_number = '0743663333東京'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end


    end


  end

end