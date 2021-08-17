class UsersController < ApplicationController
    def index
       @users = User.paginate(page: params[:page], per_page: 6)
    end


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            WelcomeMailer.with(user: @user).welcome_email.deliver_now
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Artkl! Your Blog choice. #{@user.username}"
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])  
    end

    def update
        @user = User.find(params[:id])
            if @user.update(user_params)
                flash[:success] = "Successfully Updated!..."
                redirect_to article_path
            else
                render 'edit'
            end
    end
       
    def show
        @user = User.find(params[:id])
        @user_articles =  @user.articles.paginate(page: params[:page], per_page: 5)
        
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end