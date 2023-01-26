class ServicesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @services = Service.all
    @services = policy_scope(Service)
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
  end
end
