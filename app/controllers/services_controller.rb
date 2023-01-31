class ServicesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @services = Service.all
    @services = policy_scope(Service)
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
    @service.save
    if @service.save
      redirect_to services_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @service = Service.find(params[:id])
    authorize @service
    @service.destroy
    redirect_to services_path(@service), status: :see_other
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end
end
