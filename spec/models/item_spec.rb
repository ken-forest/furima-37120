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


      context '商品の出品ができない場合' do

        it 'imageが空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空では登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品の説明が空では登録できない' do
          @item.detail = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Detail can't be blank")
        end


      end

  end






end
