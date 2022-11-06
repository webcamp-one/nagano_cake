class Public::CartItemsController < ApplicationController
  
  def create
    
  end
  
  def index
    @cart_items=current_customer.cart_items
   # @item=Item.find(cart_item_params[:item_id])
    @total=0
  end
  
  def update
    @item=Item.find(cart_item_params[:item_id])
    @item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item=Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items=current_customer.cart_items.destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
