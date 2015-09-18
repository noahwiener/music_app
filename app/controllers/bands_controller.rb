class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url(@band)
    else
      flash.now[:errors] = "invalid band"
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end


  def update
    @band = Band.find(params[:id])
    # @band.name = params[:band][:name]
    if @band.update(band_params)
      redirect_to bands_url(@band)
    else
      flash.now[:errors] = "update failed"
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name, :band_id)
  end

end
