class BookingsController < ApplicationController
  before_action :set_bike, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:rent_date)
  end

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end
end
