class SessionsController < ApplicationController

    def new
        
    end

    def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user.present? && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have logged in successfully!"
        redirect_to users_path(user)
       else
        flash.now[:danger] = "There was something wrong with your login details"
        render "new"
       end
    end

    def destroy
       session[:user_id] = nil
       flash[:success] = "You have logged out!"
       redirect_to root_path
    end
end