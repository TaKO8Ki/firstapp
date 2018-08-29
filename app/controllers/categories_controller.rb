class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

      # GET /authors
      # GET /authors.json
      def index
        @categories = Category.all
      end

      # GET /authors/1
      # GET /authors/1.json
      def show
      end

      # GET /authors/new
      def new
        @category = Category.new
      end

      # GET /authors/1/edit
      def edit
      end

      def create
          @category = Category.new(category_params)
          if @category.save
              redirect_to categories_path
          else
              render :edit
          end
      end

      # PATCH/PUT /authors/1.json
      def update
          if @category.update(category_params)
              redirect_to categories_path
          else
              render :edit
          end
      end

      def destroy
          @category.destroy
          redirect_to categories_path
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
            @category = Category.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def category_params
            params.require(:category).permit(:category)
        end

end
