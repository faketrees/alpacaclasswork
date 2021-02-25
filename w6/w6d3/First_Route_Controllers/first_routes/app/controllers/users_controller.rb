class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
        # render plain: "I'm in the index action!"
    end

    def create 
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end

    end

    def show 
        #render json: params
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
