class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :item_category_id, :shipping_fee_id, :status_id, :prefecture_id, :delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
