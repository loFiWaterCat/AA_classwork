class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end

    end

    def new
      @cat = Cat.new
      render :new
    end


    private

    def cat_params
        params.require(:cat).permit(:name, :birthday, :color, :sex, :description)
    end

end
