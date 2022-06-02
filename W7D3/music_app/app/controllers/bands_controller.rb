class BandsController < ApplicationController
  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id])
    p @band
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)

    if @band.save!
      redirect_to band_url(@band.id)
    else
      render :new
    end
  end

  private

  def band_params
    params.require[:band].permit[:name]
  end
end
