class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] =="0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] =="1"
      @address = Address.find(params[:order] [:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] =="2"
      address_new = current_customer.address.new(address_params)
      address_new.save
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.total }
  end

  def index
  end

  def complete
  end

  def show
  end

  def order_params
    params.require(:order).permit(:payment_method,:name,:postal_code,:address)
  end
  
  def address_params
  params.require(:order).permit(:name, :postal_code, :address)
  end
end
