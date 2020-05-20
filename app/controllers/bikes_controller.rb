class BikesController < ApplicationController
  before_action :set_bike, only: :show

  def new
    @bike = Bike.new
  end

  def show
    @booking = Booking.new
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
