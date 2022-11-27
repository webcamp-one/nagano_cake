class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.where(production_status: 2).count >= 1
      @order.update(order_status: 2)
    end
    if @order.order_details.count == @order_details.where(production_status: 3).count
      @order.order_status = 3
      @order.save
    end  
    @order = @order_detail.order
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
