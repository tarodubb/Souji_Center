class Cleaner::BookingsController < ApplicationController
  def index
    @service = Service.where(user: current_user)
    @cleaner_bookings = policy_scope(Booking).where(service: @service)
  end
end
