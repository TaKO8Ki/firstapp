class CategoryIndexesController < ApplicationController

    def index
        if params[:category]
            @posts = Post.category_with(params[:category])
        else
            @posts = Post.all
        end
    end

    def show
    end

    private

    def post_params
        params.require(:post).permit(:title, :content,{ :category_ids => [] })
    end

end
