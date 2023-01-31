class Cleaner::BookingsController < ApplicationController
  def index
    @service = Service.where(user: current_user)
    @cleaner_bookings = policy_scope(Booking).where(service: @service)
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(state: "approved")
    if @booking.state == "approved"
    flash[:success] = "Booking successfully approved"
    redirect_to bookings_path
    else
    flash[:error] = "Booking not approved"
    redirect_to bookings_path
    end
  end
end
