class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items=Item.page(params[:page])
  end

  def show
    @genres=Genre.all
    @item=Item.find(params[:id])
    #@items=Item.find(params[:item][:amount])
  end
  
  def search
    @genres=Genre.all
    @genre=Genre.find(params[:id])
    @items=@genre.items.page(params[:page])
  end
  
  
end
