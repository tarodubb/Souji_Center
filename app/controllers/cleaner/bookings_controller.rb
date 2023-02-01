class Cleaner::BookingsController < ApplicationController
  def index
    @service = Service.where(user: current_user)
    @cleaner_bookings = policy_scope(Booking).where(service: @service)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to cleaner_bookings_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :end_time, :service_id, :user_id, :status)
  end
end
