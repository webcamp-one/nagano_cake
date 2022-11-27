class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items=Item.page(params[:page]).per(8)
  end

  def show
    @genres=Genre.all
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end

  def search
    @genres=Genre.all
    @genre=Genre.find(params[:id])
    @items=@genre.items.page(params[:page]).per(8)
  end


end
