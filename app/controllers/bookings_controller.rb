class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @service = List.find(params[:service_id])
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
      redirect_to booking_path(@service)
    else
      render :new, status: :unprocessable_entity
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
    params.require(:booking).permit(:comment, :list_id, :movie_id)
  end
end
``
# def new
#   @restaurant = Restaurant.new
#   authorize @restaurant # Add this line
# end
# # [...]
# def create
#   @restaurant = Restaurant.new(restaurant_params)
#   @restaurant.user = current_user
#   authorize @restaurant # Add this line
#   # [...]
