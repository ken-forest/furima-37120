class ItemsController < ApplicationController

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
