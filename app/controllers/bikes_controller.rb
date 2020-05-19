class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]

  def show
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
  @bike = Bike.new(bikes_params)
  authorize @bike
  @bike.user = current_user
    if @bike.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  @bike.update(bikes_params)
  redirect_to bike_path(@bike)
  end

  def destroy
    @bike.destroy
    redirect_to root_path
  end

private

  def find_bike
  @bike = Bike.find(params[:id])
  authorize @bike
  end

  def bikes_params
    params.require(:bike).permit(:brand, :location, :price)
  end
end

