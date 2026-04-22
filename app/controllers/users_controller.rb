class UsersController < ApplicationController
  def index
    @users = User.includes(:articles).all

    render json: UserResource.new(@users).serialize
  end

  def show
    @user = User.find(params[:id])

    render json: UserResource.new(@user).serialize
  end
end
