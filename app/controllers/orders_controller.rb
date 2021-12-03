class OrdersController < ApplicationController


  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])

  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    @item = Item.find(params[:item_id])

    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end

  end




  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end



end
