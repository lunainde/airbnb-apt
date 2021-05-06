class FlatsController < ApplicationController
before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end

  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flat_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :flat_type, :address, :size, :price)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
