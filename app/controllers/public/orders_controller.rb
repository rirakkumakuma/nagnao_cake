class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
  end

  def confirm
  end

  def index
  end

  def complete
  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
