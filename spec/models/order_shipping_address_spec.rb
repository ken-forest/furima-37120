require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
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

    end


  end

end
