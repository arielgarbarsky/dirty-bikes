class BikesController < ApplicationController
  before_action :set_bike, only: :show

  def new
    @bike = Bike.new
  end

  def index
    @bikes = Bike.all
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
    @booking = Booking.new
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:brand, :price, :location, photos: [])
  end
end
