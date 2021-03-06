class Public::ItemsController < ApplicationController
  def index
     @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
end
end
