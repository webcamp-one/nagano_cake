class Admin::ItemsController < ApplicationController
  def new
    @items=Item.new
  end

  def create
    @items=Item.new(item_params)
    if @items.save
      redirect_to admin_item(item.id)
    else
      render :show
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update

  end
end
