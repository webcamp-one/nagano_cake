class Public::CartItemsController < ApplicationController
  
  def create
    
  end
  
  def index
    @cart_items=current_customer.cart_items
    @total=0
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def destroy_all
    @cart_items=current_customer.cart_items.destroy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
