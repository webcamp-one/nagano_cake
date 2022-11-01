class Admin::GenresController < ApplicationController
  def index
    @genres=Genre.new
    @genre=Genre.all
  end

  def edit
    @genre=Genre.find(params[:id])
  end
  
  def create
    @genres=Genre.new(genre_params)
    if @genres.save
      redirect_to admin_genres_path
    else
      render :index
    end
  end
  
  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :index
    end
  end
  
  def destroy
    @genre=Genre.find(params[:id])
    if @genre.destroy
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
