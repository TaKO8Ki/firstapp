class FollowsController < ApplicationController
before_action :set_current_user

def create
    @user = User.find(params[:followed_id])
    @current_user.follow(@user)
    redirect_to @user
end

def destroy
    @user = Follow.find(params[:id]).followed
    @current_user.unfollow(@user)
    redirect_to @user
end

private

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
