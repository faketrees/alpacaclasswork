class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.new(user_params)

        if user
            redirect_to user_url
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
