class OrdersController < ApplicationController


  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])

  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    @item = Item.find(params[:item_id])

    if @order_shipping_address.valid?

      Payjp.api_key = "sk_test_f8f2221228f8c0c6d73ae9ac"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

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



end
