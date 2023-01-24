class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(param[:id])
  end
end
