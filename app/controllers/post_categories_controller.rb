class PostCategoriesController < ApplicationController
    before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  # GET /author_posts
  # GET /author_posts.json
  def index
    @post_category = PostCategory.all
  end

  # GET /author_posts/1
  # GET /author_posts/1.json
  def show
  end

  # GET /author_posts/new
  def new
    @post_category = PostCategory.new
  end

  # GET /author_posts/1/edit
  def edit
  end

  # POST /author_posts
  # POST /author_posts.json
  def create
      @post_category = PostCategory.new(post_category_params)
      if @post_category.save
          redirect_to post_categories_path
      else
          render :new
      end
  end

  # PATCH/PUT /author_posts/1
  # PATCH/PUT /author_posts/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_category_params
      params.require(:post_category).permit(:post_id, :category_id)
    end
end
