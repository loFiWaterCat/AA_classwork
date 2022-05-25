class UsersController < ApplicationController
  def index
    render json: Users.all
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email)
    # replace the `user_attributes_here` with the actual attribute keys
    user.save!
    render json: user
  end

  def show
    render json: params
  end

  private
  
end

