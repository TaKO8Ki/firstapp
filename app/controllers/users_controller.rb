class UsersController < ApplicationController

    def index
        @user = User.find(params[:id])
        @post = Post.where(user_id: @user)
    end

    def show
        set_current_user
        @user = User.find(params[:id])
        @category = Category.find_by_category(params[:category])
        @all_post = Post.where(user_id: @user)

        if params[:category]
            @post = Post.category_with(params[:category]).where(user_id: @user)
        else
            @post = Post.where(user_id: @user)
        end

        @likes = Like.where(post_id: @all_post).count
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to controller: 'posts', action: 'index'
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def following
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end

    def followers
        @title = "Followers"
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follow'
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
