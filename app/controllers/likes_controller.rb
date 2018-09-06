class LikesController < ApplicationController
before_action :set_current_user

    def create
        @post = Post.find(params[:post_id])
        @usre = User.find(params[:user_id])
        @like = Like.create(user_id: @current_user.id, post_id: params[:post_id])
        @likes = Like.where(post_id: params[:post_id])
        redirect_to controller: :posts, action: :index
    end

    def destroy
        like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
        like.destroy
        redirect_to controller: :posts, action: :index
    end

private

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
