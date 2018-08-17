class PostCategoriesController < ApplicationController
    before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  def index
    @post_category = PostCategory.all
  end
    
  def show
  end

  def new
    @post_category = PostCategory.new
  end

  def edit
  end

  def create
      @post_category = PostCategory.new(post_category_params)
      if @post_category.save
          redirect_to post_categories_path
      else
          render :new
      end
  end

  def update
      if @post_category.update(post_category_params)
          redirect_to post_categories_path
      else
          render :edit
      end
  end

  def destroy
      if @post_category.destroy(post_category_params)
          redirect_to post_categories_path
      else
          render :index
      end
  end


  private
 
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

 
    def post_category_params
      params.require(:post_category).permit(:post_id, :category_id)
    end
end
