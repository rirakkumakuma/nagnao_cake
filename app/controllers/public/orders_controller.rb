class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @subtotal = @cart_items.inject(0) { |sum, item| sum + item.total }
    @order.shipping_cost = 800
    @order.total_payment = @subtotal + @order.shipping_cost
    @order.save
    @cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.order_id = @order.id
    @order_detail.amount = cart_item.amount
    @order_detail.price = cart_item.item.price
    @order_detail.save
    end
    redirect_to orders_complete_path
    current_customer.cart_items.destroy_all
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @cart_items = current_customer.cart_items.all
    @subtotal = @cart_items.inject(0) { |sum, item| sum + item.total }
    @order.shipping_cost = 800
    @order.total_payment = @subtotal + @order.shipping_cost

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
      @address_new = Address.new()
      @address_new.postal_code = params[:order][:postal_code]
      @address_new.address = params[:order][:address]
      @address_new.name = params[:order][:name]
      @address_new.save
      @order.postal_code = @address_new.postal_code
      @order.address = @address_new.address
      @order.name = @address_new.name
    end

  end

  def index
    @orders = Order.all
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])

  end

   private
  def order_params
    params.require(:order).permit(:payment_method,:name,:postal_code,:address)
  end
end
