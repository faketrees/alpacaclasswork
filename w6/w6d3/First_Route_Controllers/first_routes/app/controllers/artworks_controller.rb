class ArtworksController < ApplicationController

    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            artworks = user.artworks
           render json: artworks
        else
            artworks = Artwork.all
            render json: artworks
        end
        # render plain: "I'm in the index action!"
    end

    def create 
        artwork = Artwork.new(artwork_params)
        # replace the `artwork_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end

    end

    def show 
        artwork = Artwork.find_by(id: params[:id])
        render json: artwork
    end

    def update
       artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = artwork.find_by(id: params[:id])
        artwork.destroy
        render json: artwork
    end


    private 
    
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
