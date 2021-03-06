class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_top_page, only: [:edit, :update, :destroy]
  before_action :define_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.all.order("created_at DESC")

  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    
    @item.destroy
    redirect_to root_path

  end


  private

  def define_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :item_category_id, :item_sale_status_id, :fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_top_page
    @item = Item.find(params[:id])

    # unless user_signed_in? 
    #   redirect_to root_path 
    # end
    unless current_user == @item.user
      redirect_to root_path
    end
  end

end
