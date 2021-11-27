class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
  end


  private

  def prototype_params
    params.require(:item).permit(:image, :item_name, :detail, :price).merge(user_id: current_user.id)
  end

end
