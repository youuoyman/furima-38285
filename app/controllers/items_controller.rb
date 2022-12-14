class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_item, only: [:edit, :destroy]
 

  def index
    @items = Item.all.order(created_at: :desc)
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
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :shipping_fee_id, :status_id, :prefecture_id, :delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def correct_item
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
