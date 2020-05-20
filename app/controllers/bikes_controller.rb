class BikesController < ApplicationController
  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user

    if @bike.save
      redirect_to @bike, notice: 'Your Dirt Bike was added! 🚵‍♂️'
    else
      render :new
    end
  end

  def show
    # changed from  Bike.new to Bike.find(params[:id])
    @bike = Bike.find(params[:id])
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :price, :location, photos: [])
  end
end
