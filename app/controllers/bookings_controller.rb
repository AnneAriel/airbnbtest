class BookingsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to flat_booking_path(@flat,@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to flat_path(@flat)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
