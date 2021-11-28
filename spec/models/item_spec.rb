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

        it '商品名が空では出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品の説明が空では出品できない' do
          @item.detail = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Detail can't be blank")
        end

        it '商品カテゴリーが空では出品できない' do
          @item.item_category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category can't be blank")
        end

        it '商品の状態が空では出品できない' do
          @item.item_sale_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item sale status can't be blank")
        end

        it '配送料負担の形態が空では出品できない' do
          @item.fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee status can't be blank")
        end

        it '発送元の地域が空では出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '発送までの日数が空では出品できない' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end

        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list", "Price is invalid")
        end

        it '価格が300より低い時は出品できない' do
          @item.price = '290'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '価格が9999999より高い時は出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '価格が全角数字では出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
        end

        it '価格が数字以外では出品できない' do
          @item.price = '十万'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
        end


      end

  end






end
