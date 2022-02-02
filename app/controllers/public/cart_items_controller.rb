class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items.all
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
end
end
