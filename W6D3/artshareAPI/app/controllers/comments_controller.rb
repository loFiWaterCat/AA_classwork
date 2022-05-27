class CommentsController < ApplicationController
    def index
        if params[:user_id]
            user = User.find(params[:user_id])
            render json: user.comments
        elsif params[:artwork_id]
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.comments
        else
            render json: Comment.all
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
end
