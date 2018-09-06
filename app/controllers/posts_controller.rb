class PostsController < ApplicationController

    def index
        @likes = Like.where(post_id: params[:post_id])
        if params[:category]
            @post = Post.category_with(params[:category])
        else
            @post = Post.all.order(created_at: :desc)
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        set_current_user
        @post = Post.new(post_params)
        @post.user_id = @current_user.id
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        set_current_user
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :content, :picture, { :category_ids => [] })
        end

        def set_current_user
            @current_user = User.find_by(id: session[:user_id])
        end

end
