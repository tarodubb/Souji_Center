class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    # @user = authorize(User.find(params[:id]))
  end
end
