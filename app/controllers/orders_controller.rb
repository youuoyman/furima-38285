class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order = OrderForm.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:portal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
