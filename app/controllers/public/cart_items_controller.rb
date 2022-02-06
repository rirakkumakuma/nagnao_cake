class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id:@cart_item.item_id,customer_id:@cart_item.customer_id)
     @cart_item_exist = CartItem.find_by(item_id:@cart_item.item_id,customer_id:@cart_item.customer_id)
     @cart_item_exist.update(amount:@cart_item_exist.amount + @cart_item.amount)
     redirect_to cart_items_path
    else
     @cart_item.save
     redirect_to cart_items_path
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
    p @cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.total }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
     redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
end
end
