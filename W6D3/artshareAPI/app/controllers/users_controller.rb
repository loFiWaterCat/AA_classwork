class UsersController < ApplicationController
    def index
      render json: User.all
    end
  
    def create
      @user = User.new(user_params)
      # replace the `user_attributes_here` with the actual attribute keys
      if @user.save
          render json: @user
      else
          render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def show
      user = User.find(params[:id])
      render json: user
    end
    
    def update
      @user = User.find(params[:id])
      # debugger
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors.full_messages, status: :not_acceptable
      end
    end
  
    def destroy
      user = User.find(params[:id])
      User.destroy(params[:id])
      render json: user
    end
  
    private
    def user_params
      params.require(:user).permit(:username)
    end
    
  end
  
  