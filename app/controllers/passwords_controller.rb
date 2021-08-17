class PasswordsController < ApplicationController

    before_action :require_user

    def edit
        
    end

    def update
       
        if @current.user.update(password_params)
            flash[:success] = "Password updated Successfully!"
            redirect_to users_path(user)
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

    
end