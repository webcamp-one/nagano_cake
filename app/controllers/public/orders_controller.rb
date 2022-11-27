class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def information
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_number] == "2"
      @address = current_customer.addresses.find(params[:order][:address_number_2])
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

    @cart_items = current_customer.cart_items
    @total=0
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save# if save == true ? order_detail 作成 | render 失敗
      @cart_items = current_customer.cart_items
      @cart_items.each do |f|
        order_detail = OrderDetail.new
        order_detail.item_id = f.item_id
        order_detail.order_id = @order.id
        order_detail.price = f.item.with_tax_price
        order_detail.amount = f.amount
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render :information
    end
  end

  def index
    @order = current_customer.orders.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:postage,:total_payment,:payment_method,:order_status)
  end
  
end
