class OrdersController < ApplicationController


  def index
    @order_shipping_address = OrderShippingAddress.new

  end

  def create
    
  end




  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end



end
