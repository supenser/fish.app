class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])

  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end



  private

  def order_params
    params.require(:order).permit(:reservation_id, :fish_recipe_id, :telephone).merge(user_id: current_user.id)
  end

end
