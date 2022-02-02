class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to cart_items_path
  end

  def index
  end

  def complete
  end

  def show
  end

  def order_params
    params.require(:order).permit(:name, :price)
  end
end
