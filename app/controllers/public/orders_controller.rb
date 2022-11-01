class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def information
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
      
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      
    elsif params[:order][:address_number] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end 
  end

  def complete
  end
  
  def create
    
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:postage,:tatal_payment,:payment_method,:order_status)
  end
end
