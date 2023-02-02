class Cleaner::BookingsController < ApplicationController
  def index
    @service = Service.where(user: current_user)
    @cleaner_bookings = policy_scope(Booking).where(service: @service)
  end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @service = @booking.service
  #   authorize @booking
  #   if @booking.update(booking_params)
  #     redirect_to cleaner_bookings_path
  #   else
  #     render :index, status: :unprocessable_entity
  #   end
  # end

  # it doesn't work with namespacing because there is a problem with the routes

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :end_time, :status)
  end
end
