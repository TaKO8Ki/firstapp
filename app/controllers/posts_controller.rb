class PostsController < ApplicationController

    def index
        if params[:category]
            @post = Post.category_with(params[:category])
        else
            @post = Post.all.order(created_at: :desc)
        end
    end

    def show
        @post = Post.find_by(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save and @post.post_categories.create
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
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
            params.require(:post).permit(:title, :content,{ :category_ids => [] })
        end

end
