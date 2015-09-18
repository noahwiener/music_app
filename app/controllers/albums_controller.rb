class AlbumsController < ApplicationController

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = "bad album"
      render :new
    end
  end

  def edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
  end

  def destroy
  end

  private

  def album_params
      params.require(:album).permit(:title, :band_id)
  end
end
