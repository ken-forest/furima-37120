class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_to_root, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
    

  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    

    if @order_shipping_address.valid?

      pay_item

      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end

  end




  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def redirect_to_root
    @item = Item.find(params[:item_id])

    if current_user == @item.user
      redirect_to root_path
    end
    
    if @item.order.present?
      redirect_to root_path
    end

  end




end
