class ApplicationController < ActionController::Base
    helper_method :current_user, 

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
end
