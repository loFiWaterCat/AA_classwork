class ArtworksController < ApplicationController
    def index
        if params[:user_id] == nil
            render json: Artwork.all
        else
            user = User.find_by_id(params[:user_id])
            render json: {artworks: user.artworks, shared_artworks: user.shared_artworks}
        end
        
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end
    
    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :not_acceptable
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        Artwork.destroy(params[:id])
        render json: artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
      
end
