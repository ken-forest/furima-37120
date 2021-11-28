require 'rails_helper'

RSpec.describe Item, type: :model do


  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の出品' do

      context '商品の出品ができる場合' do

        it 'image、item_name、detail、item_category_id、item_sale_status_id、fee_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

  end






end
