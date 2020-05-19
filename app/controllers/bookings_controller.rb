class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    authorize @booking
    @bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    @booking.bike = @bike
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to root_path
  end

  private
  def bookings_params
    params.require(:booking).permit(:price)
  end
end
