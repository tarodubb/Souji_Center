class BookingsController < ApplicationController
  def index
    @user_bookings = policy_scope(Booking).where(user: current_user)
  end

  def new
    @booking = Booking.new
    @service = Service.find(params[:service_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    @booking.user = current_user
    authorize @booking
    @booking.save
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to cleaner_bookings_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
    @booking.service = @service
    @booking.user = current_user
    authorize @booking
    @booking.destroy
    redirect_to service_path(@service), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :end_time, :service_id, :user_id, :status)
  end
end
