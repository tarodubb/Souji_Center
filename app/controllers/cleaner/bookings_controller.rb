class Cleaner::BookingsController < ApplicationController
  def index
    @service = Service.where(user: current_user)
    @cleaner_bookings = policy_scope(Booking).where(service: @service)
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: 1)
    if @booking.status == 1
      flash[:success] = "Booking successfully approved"
    redirect_to booking_path(@booking)
    else
      flash[:error] = "Booking not approved"
    redirect_to bookings_path
    end
  end
end
